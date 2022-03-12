import '../models/locale_type.dart';

extension FlagExtension on String {
  String getFlag() {
    if (this == LocaleType.en.name) return '🇬🇧';
    if (this == LocaleType.ru.name) return '🇷🇺';
    return '🏳️';
  }
}
