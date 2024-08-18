import 'dart:io';
import 'dart:typed_data';

import 'package:doctor_app/core/data/models/doctor_model.dart';
import 'package:doctor_app/core/domain/error_handler/network_exceptions.dart';
import 'package:doctor_app/core/helper/file_helper.dart';
import 'package:doctor_app/core/helper/image_helper.dart';
import 'package:doctor_app/src/features/home/presentation/cubit/home_cubit.dart';
import 'package:doctor_app/src/features/patient_profile/data/models/file_model.dart';
import 'package:doctor_app/src/features/patient_profile/data/models/service_model.dart';
import 'package:doctor_app/src/features/patient_profile/data/models/session_detail_model.dart';
import 'package:doctor_app/src/features/patient_profile/data/models/session_model.dart';
import 'package:doctor_app/src/features/patient_profile/domain/repositories/patient_repo.dart';

import 'package:doctor_app/src/features/patient_profile/presentation/widgets/add_service_dialog.dart';
import 'package:doctor_app/src/features/patient_profile/presentation/widgets/upload_file_bottom_sheet.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:progress_state_button/progress_button.dart';

part 'patient_state.dart';

class PatientCubit extends Cubit<PatientState> {
  final PatientRepo _repo;

  PatientCubit(this._repo) : super(PatientInitialState());
  List<TabModel> tabs = [];
  SessionModel? session;
  List<ServiceModel> services = [];
  ButtonState addServiceButtonState = ButtonState.idle;
  int? selectedService;
  String? selectedLabStatus;
  TextEditingController addServiceDescriptionController =
      TextEditingController();
  TextEditingController fileNameController = TextEditingController();
  GlobalKey<FormState> bottomSheetFormKey = GlobalKey<FormState>();
  Uint8List? pickedFile;
  String? filePath;
  int selectedTabIndex = 0;

  Future<void> getPatientSessions(int id) async {
    emit(GetPatientSessionsLoadingState());
    final response = await _repo.getPatientSessions(id);
    response.fold((error) {
      emit(GetPatientSessionsErrorState(error));
    }, (data) async {
      // setting opened and archive session
      List<SessionModel> closedSession = [];
      List<SessionModel> openedSession = [];
      for (int i = 0; i < data.list.length; i++) {
        SessionModel temp = data.list[i] as SessionModel;
        temp.closed == 0 ? openedSession.add(temp) : closedSession.add(temp);
      }
      // if the service is empty get them to display the name of the service and to get the doctor services
      if (services.isEmpty) {
        await getServices();
      }

      emit(GetpatientSessionsSuccessState(
        openedSession: openedSession,
        closedSession: closedSession,
      ));
    });
  }

  Future<void> getSession(int id) async {
    tabs.clear();
    emit(GetSessionLoadingState());
    // id => session id
    final response = await _repo.getSession(id);
    response.fold(
      (error) {
        emit(GetSessionErrorState(error));
      },
      (data) {
        session = data.data!;
        getTabs();
        emit(GetSessionSuccessState(data.data!));
        // to get the first tab session details information
        if (tabs.isNotEmpty) {
          getSessionDetailsInformation(tabs[0].id);
        }
      },
    );
  }

  Future<void> addSessionDetails() async {
    addServiceButtonState = ButtonState.loading;
    emit(AddSessionDetailsLoadingState());
    // todo look for description
    final response = await _repo.addSessionDetails(
        sessionId: session!.id,
        serviceId: selectedService!,
        labStatus: selectedLabStatus,
        description: addServiceDescriptionController.text);
    response.fold((error) {
      addServiceButtonState = ButtonState.fail;
      emit(AddSessionDetailsErrorState(error));
    }, (data) {
      addServiceButtonState = ButtonState.idle;
      // adding the session detail to the tab bar inside the session information screen
      addTab(data.data!);
      getSessionDetailsInformation(data.data!.id);
      emit(AddSessionDetailsSuccessState());
    });
  }

  Future<void> getSessionDetailsInformation(int sessionDetailsId) async {
    // if the data is fetched already don't call the api
    for (int i = 0; i < tabs.length; i++) {
      if (tabs[i].id == sessionDetailsId) {
        if (tabs[i].fetched) {
          emit(GetSessionDetailsInformationSuccessState(
            sessionDetails: tabs[i].sessionDetails,
            sessionDetailsId: tabs[i].id,
            doctor: tabs[i].supervisorDoctor!,
          ));
          return;
        }
      }
    }
    emit(GetSessionDetailsInformationLoadingState(
      sessionDetailsId: sessionDetailsId,
    ));
    final response = await _repo.getSessionDetailsInformation(sessionDetailsId);
    response.fold((error) {
      emit(GetSessionDetailsInformationErrorState(
          error: error, sessionDetailsId: sessionDetailsId));
    }, (data) async {
      int index = tabs.indexWhere((tab) => tab.id == sessionDetailsId);
      tabs[index].sessionDetails = data.data!;
      DoctorModel? doctor =
          await getDoctorInformation(tabs[index].sessionDetails.doctorId);

      await labelTheDownloadedFile(tabs[index].sessionDetails.files);
      tabs[index].supervisorDoctor = doctor;
      tabs[index].fetched = true;
      emit(GetSessionDetailsInformationSuccessState(
        sessionDetails: tabs[index].sessionDetails,
        sessionDetailsId: sessionDetailsId,
        doctor: doctor!,
      ));
    });
  }

  Future<DoctorModel?> getDoctorInformation(int id) async {
    final response = await _repo.getDoctorInformation(id);
    return response.fold((error) => null, (data) => data.data);
  }

  Future<void> uploadFileIntoSessionDetails(
      int sessionDetailsId, String fileName, BuildContext context) async {
    emit(UploadingFileLoadingState());
    final response = await _repo.uploadFileIntoSessionDetails(
        sessionDetailsId: sessionDetailsId,
        file: pickedFile!,
        fileType: fileNameController.text,
        fileName: fileName,
        context: context);
    response.fold((error) {
      emit(UploadingFileErrorState(error));
    }, (data) {
      int index = tabs.indexWhere((tab) => tab.id == sessionDetailsId);
      tabs[index].sessionDetails.files.add(data.data!);
      fileNameController.clear();
      emit(UploadingFileSuccessState());
      emit(GetSessionDetailsInformationSuccessState(
          sessionDetails: tabs[index].sessionDetails,
          doctor: tabs[index].supervisorDoctor!,
          sessionDetailsId: sessionDetailsId));
    });
  }

  Future<void> downloadAndSaveFile(
    String path,
    BuildContext context,
    int fileId,
    String fileName,
  ) async {
    final downloadDirectory = await getDownloadsDirectory();
    String type = FileHelper.fileExtension(path);
    final filePath = '${downloadDirectory!.path}/$fileName$fileId.$type';
    final response = await _repo.downloadFile(
        path: path, savePath: filePath, context: context, fileId: fileId);
    response.fold((error) {}, (data) {
      late int index;
      for (int i = 0;
          i < tabs[selectedTabIndex].sessionDetails.files.length;
          i++) {
        if (tabs[selectedTabIndex].sessionDetails.files[i].id == fileId) {
          index = i;
          break;
        }
      }
      tabs[selectedTabIndex].sessionDetails.files[index].downloaded = true;

      emit(
        GetSessionDetailsInformationSuccessState(
            sessionDetails: tabs[selectedTabIndex].sessionDetails,
            sessionDetailsId: tabs[selectedTabIndex].id,
            doctor: tabs[selectedTabIndex].supervisorDoctor!),
      );
    });
  }

  /* Tab For Session Information Screen */
  List<TabModel> getTabs() {
    tabs.clear();
    if (tabs.isEmpty) {
      for (int i = 0; i < session!.sessionDetails.length; i++) {
        tabs.add(
          TabModel(
            tabName: getServiceNameById(session!.sessionDetails[i].serviceId),
            id: session!.sessionDetails[i].id,
            sessionDetails: session!.sessionDetails[i],
          ),
        );
      }
    }
    return tabs;
  }

  TabController getTabController(ticker) {
    return TabController(length: tabs.length, vsync: ticker);
  }

  void addTab(SessionDetailModel sessionDetail) {
    tabs.add(
      TabModel(
        tabName: getServiceNameById(sessionDetail.serviceId),
        id: sessionDetail.id,
        sessionDetails: sessionDetail,
      ),
    );
  }

  /* Files */
  Future<void> pickImage(
      ImageSource source, int sessionDetailsId, BuildContext context) async {
    await ImageHelper.pickImage(source).then((picked) async {
      if (picked != null) {
        pickedFile = picked.readAsBytesSync();
        filePath = picked.path;
        emit(PickFileSuccessState());
      }
    });
  }

  Future<void> pickFile(int sessionDetailsId, BuildContext context) async {
    await FilePicker.platform
        .pickFiles(
      type: FileType.any,
      allowMultiple: false,
    )
        .then(
      (result) async {
        if (result != null) {
          File file = File(result.files.single.path!);
          pickedFile = file.readAsBytesSync();
          filePath = result.names[0]!;
          emit(PickFileSuccessState());

          // await uploadFileIntoSessionDetails(
          //     sessionDetailsId, result.names[0]!, context);
        }
      },
    );
  }

  Future<void> labelTheDownloadedFile(List<FileModel> files) async {
    for (int i = 0; i < files.length; i++) {
      if (await FileHelper.fileExists(
          files[i].path, files[i].id, files[i].fileType)) {
        files[i].downloaded = true;
      }
    }
  }

  /* Files */
  /* Services */
  Future<void> getServices() async {
    final response = await _repo.getServices();
    response.fold(
      (error) {
        emit(GetSessionErrorState(error));
      },
      (data) {
        for (int i = 0; i < data.list.length; i++) {
          ServiceModel temp = data.list[i] as ServiceModel;
          services.add(temp);
        }
      },
    );
  }

  Map<String, int> getDoctorService() {
    int doctorSectionId = HomeCubit.doctorModel!.sectionId;
    Map<String, int> doctorServices = {};
    for (int i = 0; i < services.length; i++) {
      if (services[i].sectionId == doctorSectionId) {
        doctorServices[services[i].name] = services[i].id;
      }
    }
    print(
        "________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________v");
    print(doctorServices.length);
    return doctorServices;
  }

  String getServiceNameById(int id) {
    return services.firstWhere((element) => element.id == id).name;
  }

  /* Services */

  /* Dialogs */
  Future<void> showAddServiceDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => BlocProvider.value(
        value: this,
        child: AddServiceDialog(
          onAddPressed: () {
            addSessionDetails();
          },
          controller: addServiceDescriptionController,
        ),
      ),
    );
  }

  Future<void> showUploadFileBottomDialog(
      BuildContext mainContext, int sessionDetailsId) async {
    await showModalBottomSheet(
      context: mainContext,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return BlocProvider.value(
          value: this,
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: UploadFileBottomSheet(
              fileNameCotnroller: fileNameController,
              onCameraPressed: () async {
                await pickImage(
                    ImageSource.camera, sessionDetailsId, mainContext);
              },
              onFilePressed: () async {
                await pickFile(sessionDetailsId, mainContext);
              },
              onGalleryPressed: () async {
                await pickImage(
                    ImageSource.gallery, sessionDetailsId, mainContext);
              },
              onUploadFilePressed: () async {
                context.pop();
                await uploadFileIntoSessionDetails(
                    sessionDetailsId, filePath!, mainContext);
              },
              onDiscardPressed: () {
                filePath = null;
                pickedFile = null;
                fileNameController.clear();
                emit(DiscardFileState());
              },
            ),
          ),
        );
      },
    );
  }
  /* Dialogs */
}

class TabModel {
  String tabName;
  SessionDetailModel sessionDetails;
  DoctorModel? supervisorDoctor;
  int id;
  bool fetched;
  TabModel({
    required this.tabName,
    required this.id,
    required this.sessionDetails,
    this.supervisorDoctor,
    this.fetched = false,
  });
}
