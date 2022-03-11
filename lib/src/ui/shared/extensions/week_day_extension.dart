import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension WeekDayExtension on int {
  String getWeekDayTitle(BuildContext context) {
    final dayNow = DateTime.now().weekday;
    if (dayNow == this) return AppLocalizations.of(context)?.today ?? '-';
    switch (this) {
      case 1:
        return AppLocalizations.of(context)?.monday ?? '-';
      case 2:
        return AppLocalizations.of(context)?.thursday ?? '-';
      case 3:
        return AppLocalizations.of(context)?.wednesday ?? '-';
      case 4:
        return AppLocalizations.of(context)?.thursday ?? '-';
      case 5:
        return AppLocalizations.of(context)?.friday ?? '-';
      case 6:
        return AppLocalizations.of(context)?.saturday ?? '-';
      case 7:
        return AppLocalizations.of(context)?.sunday ?? '-';
      default:
        return '-';
    }
  }
}
