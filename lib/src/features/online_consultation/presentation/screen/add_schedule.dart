import 'package:doctor_app/core/widgets/flexible_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/routing/app_router.dart';
import '../../../../../core/widgets/toast_bar.dart';
import '../cubits/cubit/cubit.dart';
import '../cubits/cubit/states.dart';
import '../widget/add_fiels.dart';
import '../widget/clip_path_container.dart';

class AddSchedule extends StatelessWidget {
  const AddSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScheduleCubit,ScheduleStates>(
      listener: (context,state){
        if(state is Success_AddSchedule_State) {
          ToastBar.onSuccess(context, message: "Add Schedule", title: "Added Successfully");
        }
      },
      builder: (context,state){
        return  Scaffold(
          backgroundColor: Colors.white,
          appBar: appBar_Leading(title: "Add Date", backbutton: (){
            context.go(AppRouter.kBottomNavigationScreen);
          }),
          body: Stack(
            children: [
              Image.asset(
                "assets/images/Online Doctor.gif",
              ),
              ClipPathContainer(),
              Fields(context: context)
            ],
          ),
        );
      },
    );
  }
}


