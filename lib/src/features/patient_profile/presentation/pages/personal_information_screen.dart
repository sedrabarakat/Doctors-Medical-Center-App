import 'package:doctor_app/core/data/models/patient_model.dart';
import 'package:doctor_app/core/helper/dimension_helper.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/information_container.dart';
import '../widgets/personal_information_text_field.dart';

class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({super.key, required this.patient});
  final PatientModel patient;
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
              name: patient.userData.fullName,
              maritalStatus: patient.maritalStatus,
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
                        initialValue: patient.userData.firstName,
                      ),
                      PersonalInformationTextField(
                        label: 'Middle name',
                        initialValue: patient.userData.middleName,
                      ),
                      PersonalInformationTextField(
                        label: 'Last name',
                        initialValue: patient.userData.lastName,
                      ),
                      PersonalInformationTextField(
                        label: 'Date of birth',
                        initialValue: patient.birthDate,
                      ),
                      PersonalInformationTextField(
                        label: 'Address',
                        initialValue: patient.address,
                      ),
                      PersonalInformationTextField(
                        label: 'Phone number',
                        initialValue: patient.userData.phoneNumber,
                      ),
                      PersonalInformationTextField(
                        label: 'Marital status',
                        initialValue: patient.maritalStatus,
                      ),
                      patient.childrenNum != null
                          ? PersonalInformationTextField(
                              label: 'Number of children',
                              initialValue: patient.childrenNum.toString(),
                            )
                          : const SizedBox(),
                      patient.proffesion != null
                          ? PersonalInformationTextField(
                              label: 'Profession',
                              initialValue: patient.proffesion!,
                            )
                          : const SizedBox(),
                    ],
                  ),
                  const SizedBox(
                    height: AppSize.size20,
                  ),
                  InformationContainer(
                    label: 'Medical Information',
                    fields: [
                      patient.habits != null
                          ? PersonalInformationTextField(
                              label: 'Habits',
                              initialValue: patient.habits!,
                            )
                          : const SizedBox(),
                      PersonalInformationTextField(
                        label: 'Diabetes',
                        initialValue: patient.diabetes ? "Have" : "Haven't",
                      ),
                      PersonalInformationTextField(
                        label: 'Blood pressure',
                        initialValue:
                            patient.bloodPressure ? "Have" : "Haven't",
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
