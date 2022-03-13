import 'package:flutter/material.dart';

import 'weather_font_weight.dart';

class WeatherTextStyle {
  static const _baseTextStyle = TextStyle(
    package: 'weather_ui',
    fontFamily: 'GoogleSans',
    fontWeight: WeatherFontWeight.regular,
  );

  static TextStyle get headline1 {
    return _baseTextStyle.copyWith(
      fontSize: 56,
      fontWeight: WeatherFontWeight.medium,
    );
  }

  static TextStyle get headline2 {
    return _baseTextStyle.copyWith(
      fontSize: 30,
      fontWeight: WeatherFontWeight.regular,
    );
  }

  static TextStyle get headline3 {
    return _baseTextStyle.copyWith(
      fontSize: 24,
      fontWeight: WeatherFontWeight.regular,
    );
  }

  static TextStyle get headline4 {
    return _baseTextStyle.copyWith(
      fontSize: 22,
      fontWeight: WeatherFontWeight.bold,
    );
  }

  static TextStyle get headline5 {
    return _baseTextStyle.copyWith(
      fontSize: 22,
      fontWeight: WeatherFontWeight.medium,
    );
  }

  static TextStyle get headline6 {
    return _baseTextStyle.copyWith(
      fontSize: 22,
      fontWeight: WeatherFontWeight.bold,
    );
  }

  static TextStyle get subtitle1 {
    return _baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: WeatherFontWeight.bold,
    );
  }

  static TextStyle get subtitle2 {
    return _baseTextStyle.copyWith(
      fontSize: 14,
      fontWeight: WeatherFontWeight.bold,
    );
  }

  static TextStyle get bodyText1 {
    return _baseTextStyle.copyWith(
      fontSize: 18,
      fontWeight: WeatherFontWeight.medium,
    );
  }

  static TextStyle get bodyText2 {
    return _baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: WeatherFontWeight.regular,
    );
  }

  static TextStyle get caption {
    return _baseTextStyle.copyWith(
      fontSize: 14,
      fontWeight: WeatherFontWeight.regular,
    );
  }

  static TextStyle get overline {
    return _baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: WeatherFontWeight.regular,
    );
  }

  static TextStyle get button {
    return _baseTextStyle.copyWith(
      fontSize: 18,
      fontWeight: WeatherFontWeight.medium,
    );
  }
}
