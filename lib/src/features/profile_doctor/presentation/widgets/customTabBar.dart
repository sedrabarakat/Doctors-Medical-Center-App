import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fw_tab_bar/fw_tab_bar.dart';

import '../../../../../core/helper/color_helper.dart';
import '../cubit/profile_doctor_cubit.dart';

Widget customTabBar(BuildContext context ){
  return TabBarWidget(
    firstTab: 'About',
    secondTab: 'ِِِAppointment',
    onTabChanged: (int index) {
      debugPrint('Selected tab: $index');
      debugPrint('1Selected tab: ${context.read<ProfileDoctorCubit>().indexTab}');
      context.read<ProfileDoctorCubit>().indexTab = index;
      if (index == 1) {
        context.read<ProfileDoctorCubit>().selectAboutTab();
      } else if (index == 2) {
        context
            .read<ProfileDoctorCubit>()
            .selectAppointmentTab();
      }
    },
    selectedTabDecoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      border: Border.fromBorderSide(
          BorderSide(color: Color(0xFFD9D9D9))),
      color: Color(0xFFFFFFFF),
    ),
    backgroundBoxDecoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      color: ColorsHelper.primary,
    ),
    selectedTabTextStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      color: Color(0xFFFFFFFF),
      fontSize: 16,
    ),
    unselectedTabTextStyle: const TextStyle(
      fontWeight: FontWeight.normal,
      color: Color(0xFF2F2F2F),
      fontSize: 16,
    ),
  );
}