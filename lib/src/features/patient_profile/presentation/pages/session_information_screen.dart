import 'package:doctor_app/core/helper/color_helper.dart';
import 'package:doctor_app/core/helper/dimension_helper.dart';
import 'package:doctor_app/core/utils/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/custom_tab_bar.dart';
import '../widgets/patient_card.dart';

class SessionInformationScreen extends StatelessWidget {
  const SessionInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Session Details",
          style: StyleManager.fontMedium18.copyWith(
            color: ColorsHelper.black,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: ColorsHelper.black,
          ),
        ),
      ),
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: AppSize.screenPadding,
              left: AppSize.screenPadding,
              right: AppSize.screenPadding * 2,
            ),
            child: PatientCard(
              patientName: "Patient One",
              gender: "Female",
              age: "24",
              bloodType: 'B+',
              sessionDate: "2023-10-23",
            ),
          ),
          CustomTabBarView()
        ],
      ),
    );
  }
}
