import 'package:doctor_app/src/features/online_consultation/presentation/widget/clip_path_addschedule.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../cubits/cubit/cubit.dart';
import '../cubits/cubit/states.dart';
import '../widget/schedule_cell.dart';

class DoctorSchedule extends StatelessWidget {
  const DoctorSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScheduleCubit,ScheduleStates>(
      listener: (context,states){},
      builder: (context,states){
        ScheduleCubit cubit=ScheduleCubit.get(context);
        return Scaffold(
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 150.h),
                child: ListView.separated(
                    itemBuilder: (ctx, index) => scheduleCell(
                        context: context,
                        Schedule_id:cubit.myDates[index].id,
                        date: cubit.myDates[index].date,
                        fromTime: cubit.myDates[index].from_min,
                        toTime: cubit.myDates[index].to_min),
                    separatorBuilder: (context, index) => const SizedBox(),
                    itemCount: cubit.myDates.length),
              ),
              AddScheduleCon(context: context)
            ],
          ),
        );
      },
    );
  }
}


