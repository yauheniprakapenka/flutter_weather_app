import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../ui.dart';

class WeatherTheme {
  static ThemeData light() {
    return ThemeData(
      primaryColor: Get.find<AppColors>().primary,
      dividerColor: Get.find<AppColors>().divider,
      appBarTheme: _buildAppBarTheme(),
      textButtonTheme: _buildTextButtonThemeData(),
    );
  }

  static AppBarTheme _buildAppBarTheme() {
    return AppBarTheme(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.red,
      elevation: 0.0,
      titleTextStyle: WeatherTextStyle.subtitle1,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
      ),
    );
  }

  static TextButtonThemeData _buildTextButtonThemeData() {
    return TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) {
            return Get.find<AppColors>().foregroundTextButton;
          },
        ),
        textStyle: MaterialStateProperty.resolveWith(
          (states) {
            return WeatherTextStyle.button;
          },
        ),
      ),
    );
  }
}
