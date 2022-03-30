import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:ui/ui.dart';

import '../../../../../app/shared/localization/locale_provider.dart';
import 'flag_extension.dart';

class LanguagePicker extends StatelessWidget {
  const LanguagePicker({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Row(
      children: const [
        _LanguageFlag(size: 22),
        SizedBox(width: 8),
        _Picker(),
      ],
    );
  }
}

class _LanguageFlag extends StatelessWidget {
  final double size;

  const _LanguageFlag({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(context) {
    final locale = Localizations.localeOf(context);
    final flag = locale.languageCode.getFlag();
    return Text(flag, style: TextStyle(fontSize: size));
  }
}

class _Picker extends StatelessWidget {
  const _Picker({Key? key}) : super(key: key);

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
