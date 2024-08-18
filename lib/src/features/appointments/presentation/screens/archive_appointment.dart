import 'package:doctor_app/core/helper/dimension_helper.dart';
import 'package:doctor_app/core/routing/app_router.dart';
import 'package:doctor_app/core/utils/style_manager.dart';
import 'package:doctor_app/src/features/appointments/presentation/cubits/appointment_cubit.dart';
import 'package:doctor_app/src/features/appointments/presentation/cubits/appointment_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/domain/services/locator.dart';
import '../../../../../core/widgets/clip_path_container.dart';
import '../../../../../core/widgets/flexible_appbar.dart';
import '../../../online_consultation/presentation/widget/clip_path_container.dart';
import '../../../profile_doctor/presentation/widgets/profileCard.dart';

class ArchiveAppointmentScreen extends StatelessWidget {

  ArchiveAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppointmentCubit,AppointmentStates>(
      listener: (context,state){},
      builder: (context,state){
        AppointmentCubit cubit=AppointmentCubit.get(context);
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: appBar_Leading(backbutton: (){
              context.go(AppRouter.kBottomNavigationScreen);
            },title: 'Archive Appointment'),
            body: Column(
              children: [
                ClipPathContainer(height: 100.h),
                if(cubit.archiveAppointment.length>0)
                  Expanded(child:
                  ListView.builder(
                    //padding:const EdgeInsets.all(15),
                    itemCount: cubit.archiveAppointment.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: DimensionsHelper.widthPercentage(context, 3),top: DimensionsHelper.heightPercentage(context, 1), left: DimensionsHelper.widthPercentage(context, 3)),
                        child: appointmentCard(
                          context,
                          cubit.archiveAppointment[index].patient.personalInformation.fullName,
                          cubit.archiveAppointment[index].date,
                          cubit.archiveAppointment[index].start_min,
                        ),
                      );
                    },
                  ),)
              ],
            )
        );
      },
    );
  }
}
