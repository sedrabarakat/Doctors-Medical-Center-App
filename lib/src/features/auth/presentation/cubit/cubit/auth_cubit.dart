import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:doctor_app/core/domain/error_handler/network_exceptions.dart';
import 'package:doctor_app/core/helper/image_helper.dart';
import 'package:doctor_app/src/features/auth/data/model/doctor_model.dart';
import 'package:doctor_app/src/features/auth/data/model/user_model.dart';
import 'package:doctor_app/src/features/auth/data/model/working_hour_model.dart';
import 'package:doctor_app/src/features/auth/domain/repos/auth_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progress_state_button/progress_button.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _repo;
  AuthCubit(this._repo) : super(AuthInitialState());
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController signUpPhoneNumberController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController sessionDurationController = TextEditingController();
  TextEditingController daysInAdvanceController = TextEditingController();
  late WorkingHourModel workingHour;
  Uint8List? pickedProfileImage;
  ButtonState loginButtonState = ButtonState.idle;
  ButtonState verifyButtonState = ButtonState.idle;
  ButtonState signUpButtonState = ButtonState.idle;
  Map<String, dynamic> days = {
    "Sunday": <FromToController>[FromToController()],
    'Monday': <FromToController>[FromToController()],
    'Tuesday': <FromToController>[FromToController()],
    'Wednesday': <FromToController>[FromToController()],
    'Thursday': <FromToController>[FromToController()],
    'Friday': <FromToController>[FromToController()],
    'Saturday': <FromToController>[FromToController()],
  };

  String code = "";
  int waitSeconds = 10;
  bool isFinished = true;
  Future<void> requestCode() async {
    loginButtonState = ButtonState.loading;
    isFinished = false;
    emit(RequestCodeLoadingState());
    final response = await _repo.requestCode(phoneNumberController.text);
    response.fold(
      (error) {
        loginButtonState = ButtonState.fail;
        emit(RequestCodeErrorState(error: error));
      },
      (data) {
        loginButtonState = ButtonState.idle;
        emit(RequestCodeSuccessState(message: data.message));
      },
    );
  }

  Future<void> verifyCode() async {
    verifyButtonState = ButtonState.loading;
    emit(VerifyCodeLoadingState());
    final response = await _repo.verifyCode(phoneNumberController.text, code);
    response.fold((error) {
      verifyButtonState = ButtonState.fail;
      emit(VerifyCodeErrorState(error: error));
    }, (data) {
      verifyButtonState = ButtonState.idle;

      emit(VerifyCodeSuccessState(user: data.data!));
    });
  }

  Future<void> signUp() async {
    signUpButtonState = ButtonState.loading;
    setUpWorkingHour();
    emit(SignUpLoadingState());
    final response = await _repo.signUp(
      firstName: firstNameController.text,
      middleName: middleNameController.text,
      lastName: lastNameController.text,
      phoneNumber: signUpPhoneNumberController.text,
      sectionId: '1',
      sessionDuration: sessionDurationController.text,
      daysInAadvance: daysInAdvanceController.text,
      image: pickedProfileImage,
      description: descriptionController.text,
      workingHour: workingHour,
    );
    response.fold((error) {
      signUpButtonState = ButtonState.fail;
      emit(SignUpErrorState(error));
    }, (data) {
      signUpButtonState = ButtonState.idle;
      emit(SignUpSuccessState(data.data!));
    });
  }

  void addFromToWidget(String day) {
    final int lastIndex = days[day].length - 1;

    if (days[day][lastIndex].fromController.text.isNotEmpty &&
        days[day][lastIndex].toController.text.isNotEmpty) {
      days[day].add(FromToController());
    } else {
      return;
    }
    emit(EditTimeState());
  }

  Future<void> pickImage() async {
    try {
      final pickedImage = await ImageHelper.pickImage(ImageSource.camera);

      if (pickedImage != null) {
        pickedProfileImage = await pickedImage.readAsBytes();

        emit(PickImageState());
      }
    } catch (e) {
      // todo handle this error correctly
      print(e);
    }
  }

  void setUpWorkingHour() {
    workingHour = WorkingHourModel(
        friday: getWorkingHourForDay(days['Friday']),
        monday: getWorkingHourForDay(days['Monday']),
        saturday: getWorkingHourForDay(days['Saturday']),
        sunday: getWorkingHourForDay(days['Sunday']),
        thursday: getWorkingHourForDay(days['Thursday']),
        tuesday: getWorkingHourForDay(days['Tuesday']),
        wednesday: getWorkingHourForDay(days['Wednesday']));
  }

  List<String> getWorkingHourForDay(List<FromToController> day) {
    List<String> workingHour = [];
    for (int i = 0; i < day.length; i++) {
      if (day[i].fromController.text.isNotEmpty &&
          day[i].toController.text.isNotEmpty) {
        String temp =
            '${day[i].fromController.text}-${day[i].toController.text}';
        workingHour.add(temp);
      }
    }
    return workingHour;
  }

  void deleteFromToWidget(String day, int index) {
    days[day].removeAt(index);
    emit(EditTimeState());
  }

  void finishTime() {
    isFinished = true;
    waitSeconds *= 2;
    emit(FinishTimeState());
  }
}

class FromToController {
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
}
