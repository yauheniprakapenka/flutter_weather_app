import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_weather_app/src/ui/shared/localization/l10n.dart';
import 'package:flutter_weather_app/src/ui/shared/localization/models/locale_type.dart';

class LocaleProvider extends ChangeNotifier {
  late Locale _locale;

  Locale get locale => _locale;

  LocaleProvider() {
    _locale = _setDefaultLocale();
    debugPrint('locale: $_locale');
  }

  void setLocale(Locale locale) {
    if (!_isL10nContainsLocale(locale)) return;
    _locale = locale;
    notifyListeners();
  }

  Locale _setDefaultLocale() {
    final languageCode = Platform.localeName.split('_').first;
    final currentLocale = Locale(languageCode);

    return _isL10nContainsLocale(currentLocale)
        ? currentLocale
        : Locale(LocaleType.en.name);
  }

  bool _isL10nContainsLocale(Locale locale) {
    return L10n.all.contains(locale);
  }
}
