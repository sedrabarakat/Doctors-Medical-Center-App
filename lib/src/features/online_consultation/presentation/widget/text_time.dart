import 'dart:ui';

import 'package:doctor_app/core/utils/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/color_helper.dart';

Widget Text_Time({
  required String text,
  required String date
}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
    Text("$text : ",style: TextStyle(
        fontSize: 18.sp,fontWeight: FontWeight.bold,
        color: ColorsHelper.primary,
        fontFamily: 'Lobster-Regular'
    ),),
    Text("$date",style: StyleManager.fontRegular14P,),
  ],);
}