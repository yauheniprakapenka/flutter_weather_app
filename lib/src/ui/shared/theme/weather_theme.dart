import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/instance_manager.dart';

import 'app_colors.dart';

class WeatherTheme {
  final _appColors = Get.find<AppColors>();

  ThemeData light() {
    return ThemeData(
      primaryColor: _appColors.primary,
      dividerColor: _appColors.divider,
      appBarTheme: _buildAppBarTheme(),
      textButtonTheme: _buildTextButtonThemeData(),
    );
  }

  AppBarTheme _buildAppBarTheme() {
    return const AppBarTheme(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.red,
      elevation: 0.0,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 20,
        color: Colors.black,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
      ),
    );
  }

  TextButtonThemeData _buildTextButtonThemeData() {
    return TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) {
            return _appColors.foregroundTextButton;
          },
        ),
        textStyle: MaterialStateProperty.resolveWith(
          (states) {
            return const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            );
          },
        ),
      ),
    );
  }
}
