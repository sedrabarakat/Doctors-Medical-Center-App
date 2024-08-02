/* Here goes the text styles */

import 'package:doctor_app/core/helper/color_helper.dart';
import 'package:flutter/material.dart';

class StyleManager {
  /*>>>>>>>>>> ExtraBold <<<<<<<<<<*/
  static TextStyle fontExtraBold26 = const TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 26,
    color: ColorsHelper.black,
  );
  static TextStyle fontExtraBold14 = const TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 14,
    color: ColorsHelper.black,
  );
  /*>>>>>>>>>> Bold <<<<<<<<<<*/
  static TextStyle fontBold16 = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: ColorsHelper.black,
  );
  /*>>>>>>>>>> Medium <<<<<<<<<<*/
  static TextStyle fontMedium16 = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: ColorsHelper.white,
  );
  /*>>>>>>>>>> Regular <<<<<<<<<<*/
  static TextStyle fontRegular20White = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
  static TextStyle fontRegular14 = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ColorsHelper.lighGrey,
  );
}
