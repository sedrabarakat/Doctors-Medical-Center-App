import 'package:doctor_app/core/data/models/doctor_model.dart';
import 'package:doctor_app/core/helper/color_helper.dart';
import 'package:doctor_app/core/helper/dimension_helper.dart';
import 'package:doctor_app/core/utils/assets_manager.dart';
import 'package:doctor_app/core/utils/style_manager.dart';
import 'package:doctor_app/src/features/patient_profile/data/models/file_model.dart';
import 'package:doctor_app/src/features/patient_profile/presentation/cubit/patient_cubit.dart';
import 'package:doctor_app/src/features/patient_profile/presentation/cubit/upload_download_cubit.dart';
import 'package:doctor_app/src/features/patient_profile/presentation/cubit/upload_download_state.dart';

import 'package:doctor_app/src/features/patient_profile/presentation/widgets/file_card.dart';
import 'package:doctor_app/src/features/patient_profile/presentation/widgets/session_details_doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ListOfFiles extends StatelessWidget {
  const ListOfFiles({
    super.key,
    required this.files,
    required this.onUploadFilePressed,
    required this.sessionDetailsId,
    required this.doctor,
  });
  final List<FileModel> files;
  final int sessionDetailsId;
  final void Function()? onUploadFilePressed;
  final DoctorModel doctor;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientCubit, PatientState>(
      builder: (context, state) {
        if (state is UploadingFileLoadingState) {
          return Column(
            children: [
              SessionDetailsDoctorCard(
                doctor: doctor,
              ),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(AppSize.screenPadding),
                  itemBuilder: (context, index) {
                    if (index == files.length + 1) {
                      return TextButton(
                        onPressed: onUploadFilePressed,
                        child: Text(
                          'Upload File',
                          style: StyleManager.fontMedium16.copyWith(
                            color: ColorsHelper.blue,
                          ),
                        ),
                      );
                    } else if (index == files.length) {
                      return Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black38,
                              spreadRadius: .2,
                              blurRadius: 5,
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              AssetsManager.pdf,
                              height: 50,
                              fit: BoxFit.fitHeight,
                            ),
                            const SizedBox(
                              width: AppSize.size10,
                            ),
                            BlocBuilder<UploadDownloadCubit,
                                UploadDownloadState>(
                              builder: (context, state) {
                                if (state is UploadingFileState) {
                                  return Expanded(
                                    child: LinearProgressIndicator(
                                      color: ColorsHelper.blue,
                                      value: state.value,
                                    ),
                                  );
                                }
                                return const SizedBox();
                              },
                            ),
                          ],
                        ),
                      );
                    } else {
                      return FileCard(
                        onDownloadPressed: () {},
                        fileData: files[index],
                      );
                    }
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: AppSize.size10,
                  ),
                  itemCount: files.length + 2,
                ),
              ),
            ],
          );
        } else {
          return Column(
            children: [
              SessionDetailsDoctorCard(
                doctor: doctor,
              ),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(AppSize.screenPadding),
                  itemBuilder: (context, index) {
                    if (index == files.length) {
                      return TextButton(
                        onPressed: onUploadFilePressed,
                        child: Text(
                          'Upload File',
                          style: StyleManager.fontMedium16.copyWith(
                            color: ColorsHelper.blue,
                          ),
                        ),
                      );
                    } else {
                      return FileCard(
                        fileData: files[index],
                        onDownloadPressed: () {
                          BlocProvider.of<PatientCubit>(context)
                              .downloadAndSaveFile(
                            files[index].path,
                            context,
                            files[index].id,
                            files[index].fileType,
                          );
                        },
                      );
                    }
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: AppSize.size10,
                  ),
                  itemCount: files.length + 1,
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
