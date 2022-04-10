import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../test_helpers/mocks/repositories.mocks.dart';

void main() {
  final repository = MockWeatherRepositoryImpl();
  final usecase = GetTodayWeatherUseCase(weatherRepository: repository);
  const coordinates = Coordinates(latitude: 0, longitude: 0);

  test('On success get the weather', () async {
    const weather = Weather(city: 'Minsk', codeCountry: 'BLR');
    when(repository.getTodayWeather(coordinates)).thenAnswer((realInvocation) async => const Right(weather));

    final actual = await usecase.call(coordinates);

    expect(actual, equals(const Right(Weather(city: 'Minsk', codeCountry: 'BLR'))));
  });

  test('On fail get the failure', () async {
    const failure = Failure(message: '');
    when(repository.getTodayWeather(coordinates)).thenAnswer((realInvocation) async => const Left(failure));

    final actual = await usecase.call(coordinates);

    expect(actual, equals(const Left(Failure(message: ''))));
  });
}
