import 'package:doctor_app/src/features/home/presentation/cubit/home_cubit.dart';
import 'package:doctor_app/src/features/home/presentation/cubit/home_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/style_manager.dart';
import '../widgets/cntainer_stack.dart';

class Home extends StatelessWidget{
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context,state){},
      builder: (context,state){
        HomeCubit cubit =HomeCubit.get(context);
        return  Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              welcomeDr(),
              Row(children: [
                Padding(
                  padding: EdgeInsets.only(left: 30.w),
                  child: Text(
                    "My Appointments",
                    style: StyleManager.fontBold20Black.copyWith(color: Colors.grey),
                  ),
                ),
               SizedBox(width: 100.w,),
               TextButton(onPressed: (){},
                   child:
               Text('See All',style: StyleManager.fontRegular14Poppins,)),
              ],),
             /* SizedBox(
                height: 200.h,width: 200.w,
                child: ListView.separated(
                    scrollDirection:  Axis.horizontal,
                    itemBuilder: (ctx,index)=>Container(
                      height: 200.h,width: 200.w,
                      color: Colors.indigoAccent.shade100,
                    ),
                    separatorBuilder: (ctx,index)=>SizedBox(),
                    itemCount: 10),
              )*/
            ],
          )
        );
      },
    );
  }
}