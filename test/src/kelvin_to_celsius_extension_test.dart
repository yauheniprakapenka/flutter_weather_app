import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app/src/app/shared/extensions/kelvin_to_celsius_extension.dart';

void main() {
  test('Zero celsius', () {
    // Arrange
    const kelvin = 273.15;

    // Act
    final celsius = kelvin.convertKelvinToCelsius();

    // Assert
    expect(celsius, 0);
  });

  test('Rounding a positive celsius number down', () {
    // Arrange
    const kelvin = 276.4;

    // Act
    final celsius = kelvin.convertKelvinToCelsius();

    // Assert
    expect(celsius, 3);
  });

  test('Rounding a positive celsius number up', () {
    // Arrange
    const kelvin = 276.65;

    // Act
    final celsius = kelvin.convertKelvinToCelsius();

    // Assert
    expect(celsius, 4);
  });

  test('Rounding a negative celsius number down', () {
    // Arrange
    const kelvin = 269.9;

    // Act
    final celsius = kelvin.convertKelvinToCelsius();

    // Assert
    expect(celsius, -3);
  });

  test('Rounding a negative celsius number up', () {
    // Arrange
    const kelvin = 269.65;

    // Act
    final celsius = kelvin.convertKelvinToCelsius();

    // Assert
    expect(celsius, -4);
  });
}
