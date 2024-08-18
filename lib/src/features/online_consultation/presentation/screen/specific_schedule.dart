import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:doctor_app/core/routing/app_router.dart';
import 'package:doctor_app/core/utils/style_manager.dart';
import 'package:doctor_app/core/widgets/flexible_appbar.dart';
import 'package:doctor_app/src/features/online_consultation/presentation/widget/schedule_cell.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import '../../../../../core/helper/color_helper.dart';
import '../../../../../core/widgets/toast_bar.dart';
import '../cubits/cubit/cubit.dart';
import '../cubits/cubit/states.dart';
import '../widget/clip_path_container.dart';
import '../widget/patient_cell.dart';

class SpacificSchedule extends StatelessWidget {
  const SpacificSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScheduleCubit, ScheduleStates>(
      listener: (context, states) {
        if (states is Success_DeleteSpecificSchedule_State) {
          ToastBar.onSuccess(context,
              message: "Delete", title: "Deleted Successfully");
          context.go(AppRouter.kBottomNavigationScreen);
        }
      },
      builder: (context, states) {
        ScheduleCubit cubit = ScheduleCubit.get(context);
        return Scaffold(
            backgroundColor: ColorsHelper.white,
            appBar: appBar_Leading(
                title: "Appointment",
                backbutton: () {
                  context.go(AppRouter.kDoctorSchedule);
                }),
            body: ConditionalBuilder(
                condition: cubit.specificScheduleModel != null,
                builder: (BuildContext context) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipPathContainer(),
                        Padding(
                            padding: EdgeInsets.only(left: 25.w, top: 15.h),
                            child: Row(
                              children: [
                                Text(
                                  "Details",
                                  style: StyleManager.fontRegular20White
                                      .copyWith(color: Colors.grey),
                                ),
                                SizedBox(
                                  width: 200.w,
                                ),
                                IconButton(
                                    onPressed: () {
                                      cubit.deleteSpecificSchedule(
                                          context: context);
                                    },
                                    icon: const Icon(Icons.delete))
                              ],
                            )),
                        scheduleCell(
                            context: context,
                            Schedule_id: cubit.specificScheduleModel!.id,
                            date: cubit.specificScheduleModel!.date,
                            fromTime: cubit.specificScheduleModel!.from_min,
                            toTime: cubit.specificScheduleModel!.to_min),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 25.w, top: 10.h, bottom: 10.h),
                          child: Text(
                            "Registerations",
                            style: StyleManager.fontRegular20White
                                .copyWith(color: Colors.grey),
                          ),
                        ),
                        Expanded(
                            child: ListView.separated(
                                itemBuilder: (ctx, index) => patientCell(
                                    context: context,
                                    model: cubit.specificScheduleModel!
                                        .registerations[index]),
                                separatorBuilder: (ctx, index) =>
                                    const SizedBox(),
                                itemCount: cubit.specificScheduleModel!
                                    .registerations.length))
                      ],
                    ),
                fallback: (BuildContext context) => Center(
                    child:
                        Lottie.asset('assets/animation/LoadingPatient.json'))));
      },
    );
  }
}
