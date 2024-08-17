/* Here goes the text styles */

import 'package:doctor_app/core/helper/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StyleManager {
  /*>>>>>>>>>> ExtraBold <<<<<<<<<<*/
  static TextStyle fontExtraBold26 = const TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 26,
    color: ColorsHelper.black,
  );
  static TextStyle fontExtraBold20Black = const TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 20,
    color: ColorsHelper.black,
  );
  static TextStyle fontExtraBold14 = const TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 14,
    color: ColorsHelper.black,
  );
  /*>>>>>>>>>> Bold <<<<<<<<<<*/
  static TextStyle fontBold60= TextStyle(
  fontSize: 30.sp,fontWeight: FontWeight.bold,
  color: ColorsHelper.white,
  fontFamily: 'Lobster-Regular'
  );
  static TextStyle fontBold60Poppins= TextStyle(
      fontSize: 30.sp,fontWeight: FontWeight.bold,
      color: ColorsHelper.white,
      fontFamily: 'Poppins-bold'
  );

  static TextStyle fontBold24 = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: ColorsHelper.black,
  );
  static TextStyle fontBold22 = const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: ColorsHelper.white,
  );
  static TextStyle fontBold20 = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: ColorsHelper.black,
  );
  static const TextStyle fontBold20Black = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    fontFamily: 'Poppins-bold',
    color: ColorsHelper.black,
  );
  static  TextStyle fontBold20white = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.bold,
    fontFamily: 'Poppins-bold',
    color: ColorsHelper.white,
  );
  static TextStyle fontBold18 = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: ColorsHelper.black,
  );
  static TextStyle fontBold16 = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: ColorsHelper.black,
  );

  static TextStyle font14Bold= TextStyle(
    fontSize: 14.sp,fontWeight: FontWeight.bold,
    color: ColorsHelper.primary,
    fontFamily: 'Lobster-Regular',
    overflow: TextOverflow.ellipsis,
  );
  static TextStyle font14BoldDark= TextStyle(
    fontSize: 14.sp,fontWeight: FontWeight.bold,
    color: ColorsHelper.primary,
    fontFamily: 'Poppins-bold',
    overflow: TextOverflow.ellipsis,
  );
  static TextStyle fontBold14 = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.indigo,
    fontFamily: 'Poppins-bold',
  );

  /*>>>>>>>>>> Medium <<<<<<<<<<*/
  static TextStyle fontMedium18 = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.black54,
  );
  static TextStyle fontMedium16 = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: ColorsHelper.white,
  );
  static TextStyle fontMedium14 = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: ColorsHelper.white,
  );
  static TextStyle fontMedium13 = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 13,
    color: ColorsHelper.lighGrey,
  );
  /*>>>>>>>>>> Regular <<<<<<<<<<*/
  static TextStyle fontRegular20White = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
  static TextStyle fontRegular18 = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: ColorsHelper.lighGrey,
  );
  static TextStyle fontRegular16 = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: ColorsHelper.lighGrey,
  );
  static TextStyle fontRegular14P = const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: Colors.black54,
  );
  static TextStyle fontRegular14 = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ColorsHelper.lighGrey,
  );
  static const TextStyle fontRegular14Poppins = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    fontFamily: 'Poppins-bold',
    color: Colors.grey,
  );
  static TextStyle fontRegular12 = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: ColorsHelper.lighGrey,
  );

  ///boxshadows
   static BoxShadow shadow =BoxShadow(
  color: Colors.black.withOpacity(0.25),
  spreadRadius: 3,
  blurRadius: 10,
  offset: Offset(3, 7),
  );

  ///shapes BoxDecoration
  static BoxDecoration Circle_Shape({required Color color}) {
    return BoxDecoration(
      shape: BoxShape.circle,
      color: color,

    );
  }
  static BoxDecoration GryShadow20=BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.25),
          spreadRadius: 3,
          blurRadius: 10,
          offset: Offset(3, 7),
        ),
      ],
      color: Colors.grey.shade200,
      borderRadius: BorderRadius.circular(20));

  ///gardinates
  static LinearGradient indigoGradients= LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [
        ColorsHelper.primary,
        Colors.indigoAccent.withOpacity(.9),
        Colors.indigoAccent.withOpacity(.8),
        Colors.indigoAccent.withOpacity(.7),
      ]);
}
