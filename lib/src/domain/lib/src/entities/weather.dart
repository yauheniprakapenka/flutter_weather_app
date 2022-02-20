class Weather {
  /// Temperature, Kelvin. Example: 278.24
  final double temperature;

  /// Group of weather parameters (Rain, Snow, Clouds)
  final String weather;

  /// Example: Gomel
  final String city;

  // Country code. Example: BY
  final String codeCountry;

  /// Wind speed, meter/sec. Examlple: 6
  final int windSpeed;

  /// Humidity, %. Example: 70
  final int humidity;

  /// Wind direction, degrees (meteorological). Example: 230
  final int windDegrees;

  /// Atmospheric pressure, hPa. Example: 1023
  final int pressure;
  
  Weather({
    required this.temperature,
    required this.weather,
    required this.city,
    required this.codeCountry,
    required this.windSpeed,
    required this.humidity,
    required this.windDegrees,
    required this.pressure,
  });

  @override
  String toString() {
    return 'Weather(temperature: $temperature, weather: $weather, city: $city, codeCountry: $codeCountry, windSpeed: $windSpeed, humidity: $humidity, windDegrees: $windDegrees, pressure: $pressure)';
  }
}
