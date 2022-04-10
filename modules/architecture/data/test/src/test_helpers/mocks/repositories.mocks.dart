// Mocks generated by Mockito 5.1.0 from annotations
// in data/test/src/test_helpers/mocks/repositories.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:data/src/weather/repositories/weather_repository_impl.dart'
    as _i3;
import 'package:domain/domain.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [WeatherRepositoryImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockWeatherRepositoryImpl extends _i1.Mock
    implements _i3.WeatherRepositoryImpl {
  MockWeatherRepositoryImpl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i2.Failure, _i2.Weather>> getTodayWeather(
          _i2.Coordinates? coordinates) =>
      (super.noSuchMethod(Invocation.method(#getTodayWeather, [coordinates]),
              returnValue: Future<_i2.Either<_i2.Failure, _i2.Weather>>.value(
                  _FakeEither_0<_i2.Failure, _i2.Weather>()))
          as _i4.Future<_i2.Either<_i2.Failure, _i2.Weather>>);
  @override
  _i4.Future<_i2.Either<_i2.Failure, _i2.Weather>> refreshTodayWeather(
          _i2.Coordinates? coordinates) =>
      (super.noSuchMethod(
              Invocation.method(#refreshTodayWeather, [coordinates]),
              returnValue: Future<_i2.Either<_i2.Failure, _i2.Weather>>.value(
                  _FakeEither_0<_i2.Failure, _i2.Weather>()))
          as _i4.Future<_i2.Either<_i2.Failure, _i2.Weather>>);
  @override
  _i4.Future<_i2.Either<_i2.Failure, _i2.Forecast>> getFiveDaysWeatherForecast(
          _i2.Coordinates? coordinates) =>
      (super.noSuchMethod(
              Invocation.method(#getFiveDaysWeatherForecast, [coordinates]),
              returnValue: Future<_i2.Either<_i2.Failure, _i2.Forecast>>.value(
                  _FakeEither_0<_i2.Failure, _i2.Forecast>()))
          as _i4.Future<_i2.Either<_i2.Failure, _i2.Forecast>>);
  @override
  _i4.Future<_i2.Either<_i2.Failure, _i2.Forecast>>
      refreshFiveDaysWeatherForecast(_i2.Coordinates? coordinates) =>
          (super.noSuchMethod(
              Invocation.method(#refreshFiveDaysWeatherForecast, [coordinates]),
              returnValue: Future<_i2.Either<_i2.Failure, _i2.Forecast>>.value(
                  _FakeEither_0<_i2.Failure, _i2.Forecast>())) as _i4
              .Future<_i2.Either<_i2.Failure, _i2.Forecast>>);
}