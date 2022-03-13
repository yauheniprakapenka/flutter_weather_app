import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../providers/locale_provider.dart';

class LanguagePicker extends StatelessWidget {
  const LanguagePicker({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return DropdownButton<String>(
      hint: Text(context.watch<LocaleProvider>().locale.languageCode),
      items: AppLocalizations.supportedLocales.map((locale) {
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
