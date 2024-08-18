import 'package:doctor_app/core/data/models/patient_model.dart';
import 'package:doctor_app/core/domain/services/locator.dart';
import 'package:doctor_app/core/helper/color_helper.dart';
import 'package:doctor_app/core/helper/dimension_helper.dart';
import 'package:doctor_app/core/helper/string_helper.dart';
import 'package:doctor_app/core/routing/app_router.dart';
import 'package:doctor_app/core/utils/style_manager.dart';
import 'package:doctor_app/src/features/patients/presentation/cubit/patient_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/detail_card.dart';
import '../widgets/profile_button.dart';

class PatientProfileScreen extends StatelessWidget {
  const PatientProfileScreen({super.key, required this.patient});
  final PatientModel patient;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PatientCubit(getIt()),
      child: Builder(builder: (context) {
        return Scaffold(
          
          body: Column(
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
                    Row(
                      children: [
                        Expanded(
                          child: DetailCard(
                            label: 'blood',
                            icon: Icons.bloodtype,
                            iconColor: Colors.redAccent,
                            content: Text(
                              patient.bloodType,
                              style: StyleManager.fontBold20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: AppSize.size15,
                        ),
                        Expanded(
                          child: DetailCard(
                            label: 'age',
                            icon: Icons.favorite,
                            iconColor: ColorsHelper.primary,
                            content: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  text: "${patient.age} ",
                                  style: StyleManager.fontBold20,
                                ),
                                TextSpan(
                                  text: 'year old',
                                  style: StyleManager.fontMedium16.copyWith(
                                    color: Colors.black54,
                                  ),
                                )
                              ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: AppSize.size15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: DetailCard(
                            label: 'gender',
                            icon: Icons.male,
                            iconColor: ColorsHelper.primary,
                            content: Text(
                              StringHelper.capitalizeFirstLetter(
                                  patient.gender),
                              style: StyleManager.fontBold20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: AppSize.size15,
                        ),
                        Expanded(
                          child: DetailCard(
                            label: 'wallet',
                            icon: Icons.wallet,
                            iconColor: Colors.greenAccent,
                            content: Text(
                              patient.wallet.toString(),
                              style: StyleManager.fontBold20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: AppSize.size20,
                    ),
                    ProfileButton(
                      label: "Personal Information",
                      icon: Icons.person,
                      iconColor: ColorsHelper.primary,
                      onTap: () {
                        context.push(
                          AppRouter.kPatientPersonalInformationScreen,
                          extra: patient,
                        );
                      },
                    ),
                    const SizedBox(
                      height: AppSize.size15,
                    ),
                    ProfileButton(
                      label: "Sessions",
                      icon: Icons.folder_copy,
                      iconColor: Colors.orangeAccent,
                      onTap: () {
                        BlocProvider.of<PatientCubit>(context)
                            .getPatientSessions(patient.id);
                        context.push(
                          AppRouter.kPatientSessions,
                          extra: {
                            'patient': patient,
                            'cubit': BlocProvider.of<PatientCubit>(context),
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
