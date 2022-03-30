import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocaleProvider extends ChangeNotifier {
  late Locale _locale;

  Locale get locale => _locale;

  LocaleProvider() {
    _locale = _getDefaultLocale();
  }

  void setLocale(Locale locale) {
    if (!_isL10nContainsLocale(locale)) return;
    _locale = locale;
    notifyListeners();
  }

  Locale _getDefaultLocale() {
    final languageCode = ui.window.locale.languageCode;
    final currentLocale = Locale(languageCode);
    return _isL10nContainsLocale(currentLocale) ? currentLocale : Locale(LocaleType.en.name);
  }

  bool _isL10nContainsLocale(Locale locale) {
    return AppLocalizations.supportedLocales.contains(locale);
  }
}

enum LocaleType {
  en,
  ru,
}

/// Example: 
/// ```
/// context.l10n?.temperatureSymbolCelsius
/// ```
extension L10nExtension on BuildContext {
  AppLocalizations? get l10n => AppLocalizations.of(this);
}
