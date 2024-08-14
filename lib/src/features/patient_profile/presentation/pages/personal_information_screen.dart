import 'package:doctor_app/core/helper/dimension_helper.dart';
import 'package:doctor_app/src/features/patient_profile/presentation/pages/widgets/custom_app_bar.dart';
import 'package:doctor_app/src/features/patient_profile/presentation/pages/widgets/information_container.dart';
import 'package:doctor_app/src/features/patient_profile/presentation/pages/widgets/personal_information_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
              backButton: true,
              onBackButtonPressed: () {
                context.pop();
              },
            ),
            Padding(
              padding: const EdgeInsets.all(AppSize.screenPadding),
              child: Column(
                children: [
                  InformationContainer(
                    label: 'General',
                    fields: [
                      PersonalInformationTextField(
                        label: 'First name',
                        controller: TextEditingController(),
                      ),
                      PersonalInformationTextField(
                        label: 'Middle name',
                        controller: TextEditingController(),
                      ),
                      PersonalInformationTextField(
                        label: 'Last name',
                        controller: TextEditingController(),
                      ),
                      PersonalInformationTextField(
                        label: 'Date of birth',
                        controller: TextEditingController(),
                      ),
                      PersonalInformationTextField(
                        label: 'Address',
                        controller: TextEditingController(),
                      ),
                      PersonalInformationTextField(
                        label: 'Phone number',
                        controller: TextEditingController(),
                      ),
                      PersonalInformationTextField(
                        label: 'Marital status',
                        controller: TextEditingController(),
                      ),
                      PersonalInformationTextField(
                        label: 'Number of children',
                        controller: TextEditingController(),
                      ),
                      PersonalInformationTextField(
                        label: 'Profession',
                        controller: TextEditingController(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: AppSize.size20,
                  ),
                  InformationContainer(
                    label: 'Medical Information',
                    fields: [
                      PersonalInformationTextField(
                        label: 'Habits',
                        controller: TextEditingController(),
                      ),
                      PersonalInformationTextField(
                        label: 'Diabetes',
                        controller: TextEditingController(),
                      ),
                      PersonalInformationTextField(
                        label: 'Blood pressure',
                        controller: TextEditingController(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
