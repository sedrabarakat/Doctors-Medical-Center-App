import 'package:doctor_app/core/helper/color_helper.dart';
import 'package:flutter/material.dart';

/* The Application Theme */
class ThemeManager {
  static ThemeData myTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      elevation: 0.0,
      surfaceTintColor: ColorsHelper.white,
      iconTheme: IconThemeData(
        size: 18,
      ),
    ),
  );
}
