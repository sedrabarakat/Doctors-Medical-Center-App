import 'package:doctor_app/core/routing/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/helper/color_helper.dart';
import '../../../../../core/utils/style_manager.dart';

Widget AddScheduleCon({
  required BuildContext context
}){
  return ClipPath(
      clipper: WaveClipperOne(),
      child: Container(
        width: 400.w,
        height: 180.h,
        color: ColorsHelper.primary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "Online Schedule",
                style: StyleManager.fontBold60
            ),
            SizedBox(
              width: 20.w,
            ),
            IconButton(
              icon: Icon(
                Icons.add_circle,
                color: Colors.white,
                size: 30.w,
              ),
              onPressed: () {
                context.go(AppRouter.kAdd_schedule);
              },
            )
          ],
        ),
      ));
}