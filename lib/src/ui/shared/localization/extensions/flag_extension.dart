extension FlagExtension on String {
  String getFlag() {
    switch (this) {
      case 'en':
        return '🇬🇧';
      case 'ru':
        return '🇷🇺';
      default:
        return '🏳️';
    }
  }
}
