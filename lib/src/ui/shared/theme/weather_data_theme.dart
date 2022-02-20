import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData getWeatherAppTheme() {
  return ThemeData(
    primaryColor: const Color(0xFFf6cd55),
    dividerColor: const Color(0xFFBDBDBD),
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
          return const Color(0xFFf09763);
        },
      ),
      textStyle: MaterialStateProperty.resolveWith(
        (states) {
          return const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          );
        },
      ),
    ),
  );
}
