import 'package:doctor_app/core/helper/color_helper.dart';
import 'package:doctor_app/core/helper/dimension_helper.dart';
import 'package:doctor_app/core/utils/style_manager.dart';
import 'package:doctor_app/core/widgets/custom_progress_state_button.dart';
import 'package:doctor_app/core/widgets/custom_text_field.dart';
import 'package:doctor_app/src/features/patient_profile/presentation/cubit/patient_cubit.dart';
import 'package:doctor_app/src/features/patient_profile/presentation/widgets/custom_drop_down_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddServiceDialog extends StatelessWidget {
  const AddServiceDialog(
      {super.key, required this.onAddPressed, required this.controller});
  final void Function()? onAddPressed;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Add Service",
        style: StyleManager.fontBold20.copyWith(color: ColorsHelper.blue),
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomDropDownButton(
            items: BlocProvider.of<PatientCubit>(context).getDoctorService(),
            hintText: "Select a service",
            label: 'Service',
            onChnagedint: (value) {
              BlocProvider.of<PatientCubit>(context).selectedService = value;
            },
          ),
          const SizedBox(
            height: AppSize.size10,
          ),
          CustomDropDownButton(
            items: const {
              'done': 0,
              "pending": 1,
              "failed": 2,
              "none": 3,
            },
            onChnagedString: (value) {
              BlocProvider.of<PatientCubit>(context).selectedLabStatus = value;
            },
            hintText: "Lab status",
            label: 'Lab status',
          ),
          const SizedBox(
            height: AppSize.size20,
          ),
          CustomTextField(
            labelText: 'description',
            controller: controller,
            keyboardType: TextInputType.multiline,
            maxLine: 3,
          ),
        ],
      ),
      actions: [
        BlocBuilder<PatientCubit, PatientState>(
          builder: (context, state) {
            return CustomStateButton(
              onPressed: () async {
                BlocProvider.of<PatientCubit>(context)
                    .addSessionDetails()
                    .then((data) {
                  context.pop();
                });
              },
              currentState:
                  BlocProvider.of<PatientCubit>(context).addServiceButtonState,
              label: "Add",
            );
          },
        ),
      ],
    );
  }
}
