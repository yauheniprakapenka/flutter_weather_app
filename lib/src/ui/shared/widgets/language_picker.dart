import 'package:flutter/material.dart';
import 'package:flutter_weather_app/src/ui/shared/providers/locale_provider.dart';
import 'package:provider/provider.dart';

import '../localization/l10n.dart';

class LanguagePicker extends StatelessWidget {
  const LanguagePicker({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return DropdownButton<String>(
      hint: Text(context.watch<LocaleProvider>().locale.languageCode),
      items: L10n.all.map((locale) {
        return DropdownMenuItem<String>(
          value: locale.languageCode,
          child: Text(locale.languageCode),
        );
      }).toList(),
      onChanged: (languageCode) {
        context.read<LocaleProvider>().setLocale(Locale(languageCode ?? ''));
      },
    );
  }
}
