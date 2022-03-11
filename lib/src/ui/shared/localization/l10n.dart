import 'package:flutter/material.dart';
import 'package:flutter_weather_app/src/ui/shared/localization/models/locale_type.dart';

class L10n {
  // Locale-codes: https://www.science.co.il/language/Locale-codes.php.
  static final all = [
    Locale(LocaleType.en.name),
    Locale(LocaleType.ru.name),
  ];
}
