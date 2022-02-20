// Пересчёт в градусы Цельсия: tC = tK − 273 ,15

extension KelvinToCelsiusExtension on double {
  double convertKelvinToCelsiu() {
    return this - 273.15;
  }
}
