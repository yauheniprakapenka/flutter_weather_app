import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../models/locale_type.dart';

class LocaleProvider extends ChangeNotifier {
  late Locale _locale;

  Locale get locale => _locale;

  LocaleProvider() {
    _locale = _setDefaultLocale();
    debugPrint('Current locale: $_locale');
  }

  void setLocale(Locale locale) {
    if (!_isL10nContainsLocale(locale)) return;
    debugPrint('Locale changed: $_locale -> $locale');
    _locale = locale;
    notifyListeners();
  }

  Locale _setDefaultLocale() {
    final languageCode = ui.window.locale.languageCode;
    final currentLocale = Locale(languageCode);
    return _isL10nContainsLocale(currentLocale) ? currentLocale : Locale(LocaleType.en.name);
  }

  bool _isL10nContainsLocale(Locale locale) {
    return AppLocalizations.supportedLocales.contains(locale);
  }
}
