import 'package:flutter/material.dart';

import '../../../app/shared/localization/locale_provider.dart';

extension WeekDayExtension on int {
  String getWeekDayTitle(BuildContext context) {
    final dayNow = DateTime.now().weekday;
    const defaultValue = 'Unknown day of week';
    if (dayNow == this) return context.l10n?.todayPageTodayAppbarLabel ?? defaultValue;
    switch (this) {
      case 1:
        return context.l10n?.dayOfWeekMonday ?? defaultValue;
      case 2:
        return context.l10n?.dayOfWeekTuesday ?? defaultValue;
      case 3:
        return context.l10n?.dayOfWeekWednesday ?? defaultValue;
      case 4:
        return context.l10n?.dayOfWeekThursday ?? defaultValue;
      case 5:
        return context.l10n?.dayOfWeekFriday ?? defaultValue;
      case 6:
        return context.l10n?.dayOfWeekSaturday ?? defaultValue;
      case 7:
        return context.l10n?.dayOfWeekSunday ?? defaultValue;
      default:
        return defaultValue;
    }
  }
}
