import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension WeekDayExtension on int {
  String getWeekDayTitle(BuildContext context) {
    final dayNow = DateTime.now().weekday;
    const defaultValue = '-';
    if (dayNow == this) return AppLocalizations.of(context)?.today ?? defaultValue;
    switch (this) {
      case 1:
        return AppLocalizations.of(context)?.monday ?? defaultValue;
      case 2:
        return AppLocalizations.of(context)?.thursday ?? defaultValue;
      case 3:
        return AppLocalizations.of(context)?.wednesday ?? defaultValue;
      case 4:
        return AppLocalizations.of(context)?.thursday ?? defaultValue;
      case 5:
        return AppLocalizations.of(context)?.friday ?? defaultValue;
      case 6:
        return AppLocalizations.of(context)?.saturday ?? defaultValue;
      case 7:
        return AppLocalizations.of(context)?.sunday ?? defaultValue;
      default:
        return defaultValue;
    }
  }
}
