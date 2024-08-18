import 'package:doctor_app/core/widgets/custom_progress_state_button.dart';
import 'package:doctor_app/core/widgets/custom_text_field.dart';
import 'package:doctor_app/src/features/patient_profile/presentation/cubit/patient_cubit.dart';
import 'package:doctor_app/src/features/patient_profile/presentation/widgets/icon_button_with_title.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_state_button/progress_button.dart';

class UploadFileBottomSheet extends StatelessWidget {
  const UploadFileBottomSheet({
    super.key,
    required this.onCameraPressed,
    required this.onFilePressed,
    required this.onGalleryPressed,
    required this.onDiscardPressed,
    required this.onUploadFilePressed,
    required this.fileNameCotnroller,
  });
  final void Function()? onCameraPressed;
  final void Function()? onGalleryPressed;
  final void Function()? onFilePressed;
  final void Function()? onUploadFilePressed;
  final void Function()? onDiscardPressed;
  final TextEditingController fileNameCotnroller;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<PatientCubit>(context).bottomSheetFormKey,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 40),
        child: BlocBuilder<PatientCubit, PatientState>(
          builder: (context, state) {
            if (state is PickFileSuccessState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextField(
                    labelText: "File Name",
                    controller: fileNameCotnroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "File name must not be empty";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomStateButton(
                    onPressed: () {
                      if (BlocProvider.of<PatientCubit>(context)
                          .bottomSheetFormKey
                          .currentState!
                          .validate()) {
                        onUploadFilePressed!();
                      }
                    },
                    currentState: ButtonState.idle,
                    label: "Upload",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomStateButton(
                    onPressed: onDiscardPressed,
                    currentState: ButtonState.idle,
                    label: "Discard",
                  ),
                ],
              );
            }
            return Row(
              children: <Widget>[
                Expanded(
                  child: IconButtonWithTitle(
                    onTap: onCameraPressed,
                    icon: Icons.camera_alt,
                    label: "Camera",
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: IconButtonWithTitle(
                    icon: Icons.image,
                    onTap: onGalleryPressed,
                    label: "Gallery",
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: IconButtonWithTitle(
                    icon: Icons.file_copy,
                    onTap: onFilePressed,
                    label: 'Storage',
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
