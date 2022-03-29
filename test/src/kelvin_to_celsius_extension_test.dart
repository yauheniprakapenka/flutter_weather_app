import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app/src/ui/shared/extensions/kelvin_to_celsius_extension.dart';

void main() {
  test('0 C', () {
    final actual = 273.15.convertKelvinToCelsium();
    expect(actual, 10);
  });
}
