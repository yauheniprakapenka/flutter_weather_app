import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

import '../../weather_ui.dart';

class WeatherTextStyle {
  static final _baseTextStyle = TextStyle(
    package: 'weather_ui',
    fontFamily: 'GoogleSans',
    fontWeight: WeatherFontWeight.regular,
    color: Get.find<AppColors>().onBackground,
  );

  static TextStyle get headline1 {
    return _baseTextStyle.copyWith(
      fontSize: 96,
      fontWeight: WeatherFontWeight.light,
      letterSpacing: -1.5,
    );
  }

  static TextStyle get headline2 {
    return _baseTextStyle.copyWith(
      fontSize: 60,
      fontWeight: WeatherFontWeight.light,
      letterSpacing: -0.5,
    );
  }

  static TextStyle get headline3 {
    return _baseTextStyle.copyWith(
      fontSize: 48,
      fontWeight: WeatherFontWeight.regular,
      letterSpacing: 0,
    );
  }

  static TextStyle get headline4 {
    return _baseTextStyle.copyWith(
      fontSize: 34,
      fontWeight: WeatherFontWeight.regular,
      letterSpacing: 0.25,
    );
  }

  static TextStyle get headline5 {
    return _baseTextStyle.copyWith(
      fontSize: 24,
      fontWeight: WeatherFontWeight.regular,
      letterSpacing: 0,
    );
  }

  static TextStyle get headline6 {
    return _baseTextStyle.copyWith(
      fontSize: 20,
      fontWeight: WeatherFontWeight.medium,
    );
  }

  static TextStyle get subtitle1 {
    return _baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: WeatherFontWeight.medium,
      letterSpacing: 0.15,
    );
  }

  static TextStyle get subtitle2 {
    return _baseTextStyle.copyWith(
      fontSize: 14,
      fontWeight: WeatherFontWeight.regular,
      letterSpacing: 0.1,
    );
  }

  static TextStyle get bodyText1 {
    return _baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: WeatherFontWeight.regular,
      letterSpacing: 0.5,
    );
  }

  static TextStyle get bodyText2 {
    return _baseTextStyle.copyWith(
      fontSize: 14,
      fontWeight: WeatherFontWeight.regular,
      letterSpacing: 0.25,
    );
  }

  static TextStyle get button {
    return _baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: WeatherFontWeight.medium,
      letterSpacing: 0.25,
    );
  }

  static TextStyle get caption {
    return _baseTextStyle.copyWith(
      fontSize: 12,
      fontWeight: WeatherFontWeight.regular,
      letterSpacing: 0.4,
    );
  }

  static TextStyle get overline {
    return _baseTextStyle.copyWith(
      fontSize: 10,
      fontWeight: WeatherFontWeight.regular,
      letterSpacing: 1.5,
    );
  }
}
