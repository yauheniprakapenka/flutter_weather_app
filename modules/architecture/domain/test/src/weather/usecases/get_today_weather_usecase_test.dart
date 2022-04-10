import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Successfully fetch today weather', () async {
    const coordinates = Coordinates(latitude: 0, longitude: 0);
    const sut = GetTodayWeatherUseCase(weatherRepository: _MockWeatherRepositorySuccessfully());

    final actual = await sut.call(coordinates);

    expect(actual.fold((l) => l, (r) => r), isA<Weather>());
  }); 

  test('Failed fetch today weather', () async {
    const coordinates = Coordinates(latitude: 0, longitude: 0);
    const sut = GetTodayWeatherUseCase(weatherRepository: _MockWeatherRepositoryFailed());

    final actual = await sut.call(coordinates);

    expect(actual.fold((l) => l, (r) => r), isA<Failure>());
  }); 
}

class _MockWeatherRepositorySuccessfully implements IWeatherRepository {
  const _MockWeatherRepositorySuccessfully();

  @override
  Future<Either<Failure, Forecast>> getFiveDaysWeatherForecast(Coordinates coordinates) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Weather>> getTodayWeather(Coordinates coordinates) async {
    return const Right(Weather());
  }

  @override
  Future<Either<Failure, Forecast>> refreshFiveDaysWeatherForecast(Coordinates coordinates) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Weather>> refreshTodayWeather(Coordinates coordinates) {
    throw UnimplementedError();
  }
}

class _MockWeatherRepositoryFailed implements IWeatherRepository {
  const _MockWeatherRepositoryFailed();

  @override
  Future<Either<Failure, Forecast>> getFiveDaysWeatherForecast(Coordinates coordinates) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Weather>> getTodayWeather(Coordinates coordinates) async {
    return const Left(Failure(message: ''));
  }

  @override
  Future<Either<Failure, Forecast>> refreshFiveDaysWeatherForecast(Coordinates coordinates) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Weather>> refreshTodayWeather(Coordinates coordinates) {
    throw UnimplementedError();
  }
}
