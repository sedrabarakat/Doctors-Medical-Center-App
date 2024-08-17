import 'package:doctor_app/core/utils/style_manager.dart';
import 'package:flutter/material.dart';


Widget Text_Data({
  required String text,
  required String data,
  TextStyle ?textstyle
}){

  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
    Text("$text : ",style: (textstyle!=null)?textstyle:StyleManager.font14Bold,),
    Text("$data",style: StyleManager.fontRegular14P,),
  ],);
}