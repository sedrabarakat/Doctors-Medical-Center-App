import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:doctor_app/core/helper/color_helper.dart';
import 'package:doctor_app/core/routing/app_router.dart';
import 'package:doctor_app/src/features/home/presentation/cubit/home_cubit.dart';
import 'package:doctor_app/src/features/home/presentation/cubit/home_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/style_manager.dart';
import '../../../patient_profile/presentation/widgets/patients_listview.dart';
import '../widgets/appintment_widget.dart';
import '../widgets/container_stack.dart';
import '../widgets/recent_patient.dart';

class Home extends StatelessWidget{
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context,state){},
      builder: (context,state){
        HomeCubit cubit =HomeCubit.get(context);
        return  Scaffold(
          backgroundColor: ColorsHelper.white,
          body: ConditionalBuilder(
            condition: HomeCubit.doctorModel!=null,
            builder: (context)=>SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  welcomeDr(context: context),
                  ConditionalBuilder(
                      condition: cubit.isHome,
                      builder: (context)=>Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 30.w,bottom: 10.h),
                            child: Text(
                              "The Next Patient",
                              style: StyleManager.fontBold20Black.copyWith(color: Colors.grey),
                            ),
                          ),
                          if(cubit.nextPatient!=null)
                            RecentPatient(nextPatient: cubit.nextPatient!),
                          Row(children: [
                            Padding(
                              padding: EdgeInsets.only(left: 30.w,top: 5.h),
                              child: Text(
                                "My Appointments",
                                style: StyleManager.fontBold20Black.copyWith(color: Colors.grey),
                              ),
                            ),
                            SizedBox(width: 100.w,),
                            TextButton(onPressed: (){
                              context.go(AppRouter.kAppointment);
                            },
                                child:
                                Text('See All',style: StyleManager.fontRegular14Poppins,)),
                          ],),
                          if(cubit.list.length>0)
                            SizedBox(
                              height: 200.h,
                              child: ListView.separated(
                                  scrollDirection:  Axis.horizontal,
                                  itemBuilder: (ctx,index)=>appointmentWidget(model: cubit.list[index]),
                                  separatorBuilder: (ctx,index)=>SizedBox(),
                                  itemCount: cubit.list.length),
                            ),
                        ],
                      ),
                      fallback: (context)=>PatientsListView(cubit:cubit)

                  )
                ],
              ),
            ),
            fallback: (context)=>Center(child: CircularProgressIndicator()),
          )
        );
      },
    );
  }
}