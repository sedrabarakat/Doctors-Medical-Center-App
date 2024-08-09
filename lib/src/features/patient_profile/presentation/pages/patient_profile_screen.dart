import 'package:doctor_app/core/helper/color_helper.dart';
import 'package:doctor_app/core/helper/dimension_helper.dart';
import 'package:doctor_app/core/routing/app_router.dart';
import 'package:doctor_app/core/utils/style_manager.dart';
import 'package:doctor_app/src/features/patient_profile/presentation/pages/widgets/custom_app_bar.dart';
import 'package:doctor_app/src/features/patient_profile/presentation/pages/widgets/detail_card.dart';
import 'package:doctor_app/src/features/patient_profile/presentation/pages/widgets/profile_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PatientProfileScreen extends StatelessWidget {
  const PatientProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(),
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
                          "AB",
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
                              text: '24 ',
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
                          "Male",
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
                          "1000",
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
                    context.push(AppRouter.kPatientPersonalInformationScreen);
                  },
                ),
                const SizedBox(
                  height: AppSize.size15,
                ),
                ProfileButton(
                  label: "Sessions",
                  icon: Icons.folder_copy,
                  iconColor: Colors.orangeAccent,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
