import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'app_colors.dart';

class AppTheme {
  final BuildContext context;

  AppTheme(this.context);

  ThemeData init() {
    return ThemeData(
      primaryColor: context.read<AppColors>().primary,
      dividerColor: context.read<AppColors>().divider,
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
            return context.read<AppColors>().foregroundTextButton;
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
