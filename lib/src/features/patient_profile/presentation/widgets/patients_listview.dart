import 'package:doctor_app/src/features/patient_profile/presentation/widgets/patient_cell.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routing/app_router.dart';

Widget PatientsListView({required cubit}) {
  return SizedBox(
    height: 500.h,
    child: ListView.separated(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) => patientCellList(
          tap: () {
            context.push(
              AppRouter.kPatientProfileScreen,
              extra: cubit.myPatients[index],
            );
          },
          patient: cubit.myPatients[index]),
      separatorBuilder: (context, index) => const SizedBox(),
      itemCount: cubit.myPatients.length,
    ),
  );
}
