import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/style_manager.dart';

Widget Image_widget({
  required var image,
  double width= 55

}){
  return Container(
    clipBehavior: Clip.hardEdge,
      width: width.w,
      decoration: StyleManager.Circle_Shape(color:Colors.grey),
      child: (image!=null)?SizedBox():Image.asset(AssetsManager.defUser,fit: BoxFit.cover
      )
  );
}
