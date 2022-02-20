class Weather {
  /// Temperature, Kelvin. Example: 278.24
  final double temperature;

  /// Group of weather parameters. Example: Rain, Snow, Clouds
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

  /// Rain volume for the last 1 hour, mm. Example: 1.0
  final double rainVolume;

  const Weather({
    this.temperature = 0,
    this.weather = '',
    this.city = '',
    this.codeCountry = '',
    this.windSpeed = 0,
    this.humidity = 0,
    this.windDegrees = 0,
    this.pressure = 0,
    this.rainVolume = 0,
  });

  @override
  String toString() {
    return 'Weather(temperature: $temperature, weather: $weather, city: $city, codeCountry: $codeCountry, windSpeed: $windSpeed, humidity: $humidity, windDegrees: $windDegrees, pressure: $pressure, raiVolume: $rainVolume)';
  }
}
