import '../../../../../app/shared/localization/locale_provider.dart';

extension FlagExtension on String {
  String getFlag() {
    if (this == LocaleType.en.name) return '🇬🇧';
    if (this == LocaleType.ru.name) return '🇷🇺';
    return '🏳️';
  }
}
