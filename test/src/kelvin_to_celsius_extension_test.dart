import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app/src/app/shared/extensions/kelvin_to_celsius_extension.dart';

void main() {
  test('Zero celsius', () {
    const kelvin = 273.15;

    final celsius = kelvin.convertKelvinToCelsius();

    expect(celsius, 0);
  });

  test('Rounding a positive celsius number down', () {
    const kelvin = 276.4;

    final celsius = kelvin.convertKelvinToCelsius();

    expect(celsius, 3);
  });

  test('Rounding a positive celsius number up', () {
    const kelvin = 276.65;

    final celsius = kelvin.convertKelvinToCelsius();

    expect(celsius, 4);
  });

  test('Rounding a negative celsius number down', () {
    const kelvin = 269.9;

    final celsius = kelvin.convertKelvinToCelsius();

    expect(celsius, -3);
  });

  test('Rounding a negative celsius number up', () {
    const kelvin = 269.65;

    final celsius = kelvin.convertKelvinToCelsius();

    expect(celsius, -4);
  });
}
