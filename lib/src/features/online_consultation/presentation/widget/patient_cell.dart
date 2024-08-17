import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helper/color_helper.dart';
import '../../../../../core/utils/style_manager.dart';
import '../../../../../core/widgets/image_widget.dart';
import '../../data/models/registeraitions.dart';
import '../cubits/cubit/cubit.dart';



Widget patientCell({
  required context,
  required RegisteraitionsModel model
}){
  ScheduleCubit cubit=ScheduleCubit.get(context);
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 25.w),
    child: Container(
        clipBehavior: Clip.hardEdge,
        padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
        height: 70.h,
        decoration: BoxDecoration(
            color: ColorsHelper.blueLightest,
            borderRadius: BorderRadius.circular(30)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image_widget(image: null),
            SizedBox(width: 20.w,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(model.patient.personalInformation.fullName,style: StyleManager.fontRegular18.copyWith(
                    color: Colors.black54
                ),),
              ],),
            SizedBox(width: 33.w,),
            IconButton(onPressed: (){
             cubit.sendCallEvent(registeration: model,context: context);
            }, icon: Icon(Icons.call))
          ],
        )
    ),
  );
}