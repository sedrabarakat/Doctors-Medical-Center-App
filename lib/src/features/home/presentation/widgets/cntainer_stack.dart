import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/style_manager.dart';
import '../../../../../core/widgets/text_from_field.dart';
import '../../../online_consultation/presentation/widget/clip_path_container.dart';

Widget welcomeDr() {
  return Stack(
    children: [
      ClipPathContainer(height: 230.h),
      Padding(
        padding: EdgeInsets.only(left: 20.w, top: 140.h,right: 20.w),
        child: Container(
          height: 150.h,width: 400.w,
          decoration: BoxDecoration(
              boxShadow: [
                StyleManager.shadow
              ],
              gradient:  LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Colors.blue.withOpacity(.9),
                    Colors.blueAccent.withOpacity(.8),
                    Colors.indigoAccent.withOpacity(.7),
                  ]),
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: EdgeInsets.only(left: 20.w,top: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome Back',style: StyleManager.fontBold60,),
                Text('Dr.Adam',style: StyleManager.fontBold60,),
              ],
            )
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 60.h,left: 20.w,right: 20.w),
        child: SizedBox(
            width: 400.w,
            child: TextField_def(
              hintText: 'Search for Patient',
             filled: true,fillColor: Colors.white24,
              borderStyle: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(30)
              ),
            )),
      ),
      Padding(
        padding: EdgeInsets.only(top: 140.h,left: 210.w),
        child: Image.asset('assets/images/med.png',height: 200.h,),
      )

    ],
  );
}