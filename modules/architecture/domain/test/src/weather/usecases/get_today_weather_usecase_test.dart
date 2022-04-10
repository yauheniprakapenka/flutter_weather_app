import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../test_helpers/mocks/repositories.mocks.dart';

void main() {
  const coordinates = Coordinates(latitude: 0, longitude: 0);
  final repository = MockIWeatherRepository();
  final usecase = GetTodayWeatherUseCase(weatherRepository: repository);

  test('On success get the weather type', () async {
    when(repository.getTodayWeather(coordinates)).thenAnswer((_) async => const Right(Weather()));

    final actual = await usecase.call(coordinates);

    expect(actual.fold((l) => l, (r) => r), isA<Weather>());
  }); 

  test('On fail get the failure type', () async {
    when(repository.getTodayWeather(coordinates)).thenAnswer((_) async => const Left(Failure(message: '')));

    final actual = await usecase.call(coordinates);

    expect(actual.fold((l) => l, (r) => r), isA<Failure>());
  }); 
}
