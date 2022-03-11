import 'package:flutter/material.dart';
import 'package:flutter_weather_app/src/ui/shared/localization/l10n.dart';
import 'package:flutter_weather_app/src/ui/shared/localization/models/locale_type.dart';

class LocaleProvider extends ChangeNotifier {
  var _locale = Locale(LocaleType.en.name);

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }
}
