import 'package:doctor_app/core/widgets/text_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/helper/color_helper.dart';
import '../cubits/cubit/cubit.dart';

Widget scheduleCell({
  required BuildContext context,
  required int Schedule_id,
  required String date,
  required String fromTime,
  required String toTime,
}) {
  ScheduleCubit cubit = ScheduleCubit.get(context);
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 23.w),
    child: InkWell(
      onTap: () {
        cubit.setSchedule_id(value: Schedule_id);
        cubit.getSpecificSchedule();
        context.push('/specific_schedule');
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        height: 90.h,
        decoration: BoxDecoration(
            color: ColorsHelper.blueLightest,
            borderRadius: BorderRadius.circular(30)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text_Data(text: "Date", data: date),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Text_Data(text: "from", data: fromTime),
                SizedBox(
                  width: 45.w,
                ),
                Text_Data(text: "to", data: toTime)
              ],
            )
          ],
        ),
      ),
    ),
  );
}
