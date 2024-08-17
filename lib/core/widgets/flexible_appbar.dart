import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helper/color_helper.dart';
import '../utils/style_manager.dart';

PreferredSizeWidget appBar_Leading({
  required String title,
  required VoidCallback backbutton,
}){
  return AppBar(
    flexibleSpace: FlexibleSpaceBar(
      titlePadding: EdgeInsets.only(top: 10.h),
      centerTitle: true,
      title: Text(title, style: StyleManager.fontBold60),
      background: Container(
          color: ColorsHelper.primary), // Solid color, no transparency
    ),
    surfaceTintColor: ColorsHelper.primary,
    backgroundColor: ColorsHelper.primary,
    leading: IconButton(
      onPressed: backbutton,
      icon: const Icon(
        Icons.arrow_back_ios,
        color: ColorsHelper.white,
      ),
    ),
  );
}

PreferredSizeWidget appBar({
  required String title,
}){
  return AppBar(
    flexibleSpace: FlexibleSpaceBar(
      titlePadding: EdgeInsets.only(top: 10.h),
      centerTitle: true,
      title: Text(title, style: StyleManager.fontBold60),
      background: Container(
          color: ColorsHelper.primary), // Solid color, no transparency
    ),
    surfaceTintColor: ColorsHelper.primary,
    backgroundColor: ColorsHelper.primary,
  );
}