import 'package:flutter/material.dart';
import 'package:flutter_weather_app/src/ui/shared/localization/extensions/flag_extension.dart';

class LanguageFlag extends StatelessWidget {
  const LanguageFlag({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    final locale = Localizations.localeOf(context);
    final flag = locale.languageCode.getFlag();
    return Text(
      flag,
      style: const TextStyle(fontSize: 60),
    );
  }
}
