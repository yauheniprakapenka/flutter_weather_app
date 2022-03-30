// Пересчёт в градусы Цельсия: tC = tK − 273,15.

extension KelvinToCelsiusExtension on num {
  int convertKelvinToCelsius() {
    return (this - 273.15).round();
  }
}
