import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:ui/ui.dart';

import '../../localization/providers/locale_provider.dart';

class Picker extends StatelessWidget {
  const Picker({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return DropdownButton<String>(
      hint: Text(context.watch<LocaleProvider>().locale.languageCode),
      items: AppLocalizations.supportedLocales.map((locale) {
        return DropdownMenuItem<String>(
          value: locale.languageCode,
          child: Text(
            locale.languageCode,
            style: WeatherTextStyle.bodyText1.copyWith(
              color: Get.find<AppColors>().onBackground,
            ),
          ),
        );
      }).toList(),
      onChanged: (languageCode) {
        context.read<LocaleProvider>().setLocale(Locale(languageCode ?? ''));
      },
    );
  }
}
