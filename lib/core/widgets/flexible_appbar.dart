import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progress_state_button/iconed_button.dart';

import '../helper/color_helper.dart';
import '../utils/style_manager.dart';

PreferredSizeWidget appBar_Leading(
    {required String title,
    required VoidCallback backbutton,
    bool thereAction = false,
    String? text,
    VoidCallback? actionbutton}) {
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
    actions: [
      (thereAction)
          ? Padding(
              padding: EdgeInsets.only(top: 20.h, left: 2.w),
              child: TextButton(
                  onPressed: actionbutton,
                  child: Text(
                    text!,
                    style: StyleManager.fontBold20white,
                  )),
            )
          : SizedBox()
    ],
  );
}

PreferredSizeWidget appBar({
  required String title,
  IconData? leadingIcon,
  void Function()? onLeadingPressed,
}) {
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
    leading: leadingIcon != null
        ? IconButton(
            onPressed: onLeadingPressed,
            icon: Icon(
              leadingIcon,
              color: Colors.white,
              size: 28,
            ),
          )
        : null,
  );
}
