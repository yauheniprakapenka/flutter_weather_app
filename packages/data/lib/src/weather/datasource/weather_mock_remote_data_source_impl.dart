import 'dart:convert';

import 'package:domain/domain.dart';

import '../dto/forecast_dto.dart';
import '../dto/weather_dto.dart';
import 'i_weather_remote_data_source.dart';

class WeatherMockRemoteDataSourceImpl implements IWeatherRemoteDataSource {
  @override
  Future<WeatherDto> getTodayWeather(Coordinates coordinates) async {
    await Future.delayed(const Duration(seconds: 1));
    final Map<String, dynamic> decodedJson = jsonDecode(_weatherStubJson);
    return WeatherDto.fromJson(decodedJson);
  }

  @override
  Future<ForecastDto> getFiveDaysWeatherForecast(Coordinates coordinates) async {
    await Future.delayed(const Duration(seconds: 1));
    final Map<String, dynamic> decodedJson = jsonDecode(_forecastStubJson);
    return ForecastDto.fromJson(decodedJson);
  }
}

const _weatherStubJson = '''
{
  "coord": {
    "lon": 31.0224,
    "lat": 52.4508
  },
  "weather": [
    {
      "id": 803,
      "main": "Clouds",
      "description": "broken clouds",
      "icon": "04d"
    }
  ],
  "base": "stations",
  "main": {
    "temp": 278.24,
    "feels_like": 274.16,
    "temp_min": 278.22,
    "temp_max": 278.72,
    "pressure": 1009,
    "humidity": 70
  },
  "visibility": 10000,
  "wind": {
    "speed": 6,
    "deg": 230,
    "gust": 9
  },
  "clouds": {
    "all": 75
  },
  "rain": {
    "1h": 1.0
  },
  "dt": 1645359132,
  "sys": {
    "type": 1,
    "id": 8933,
    "country": "BY",
    "sunrise": 1645333351,
    "sunset": 1645370229
  },
  "timezone": 10800,
  "id": 627907,
  "name": "Gomel",
  "cod": 200
}
''';

const _forecastStubJson = '''
{
  "cod": "200",
  "message": 0,
  "cnt": 40,
  "list": [
    {
      "dt": 1645434000,
      "main": {
        "temp": 274.63,
        "feels_like": 269.53,
        "temp_min": 274.63,
        "temp_max": 275.84,
        "pressure": 1002,
        "sea_level": 1002,
        "grnd_level": 987,
        "humidity": 87,
        "temp_kf": -1.21
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {
        "all": 96
      },
      "wind": {
        "speed": 6.11,
        "deg": 192,
        "gust": 12.14
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2022-02-21 09:00:00"
    },
    {
      "dt": 1645444800,
      "main": {
        "temp": 276.02,
        "feels_like": 270.97,
        "temp_min": 276.02,
        "temp_max": 277.02,
        "pressure": 1000,
        "sea_level": 1000,
        "grnd_level": 985,
        "humidity": 84,
        "temp_kf": -1
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {
        "all": 95
      },
      "wind": {
        "speed": 6.89,
        "deg": 199,
        "gust": 14.08
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2022-02-21 12:00:00"
    },
    {
      "dt": 1645455600,
      "main": {
        "temp": 277.58,
        "feels_like": 272.56,
        "temp_min": 277.58,
        "temp_max": 277.58,
        "pressure": 998,
        "sea_level": 998,
        "grnd_level": 984,
        "humidity": 90,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {
        "all": 100
      },
      "wind": {
        "speed": 8.07,
        "deg": 211,
        "gust": 14.76
      },
      "visibility": 10000,
      "pop": 0.33,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2022-02-21 15:00:00"
    },
    {
      "dt": 1645466400,
      "main": {
        "temp": 277.18,
        "feels_like": 272.45,
        "temp_min": 277.18,
        "temp_max": 277.18,
        "pressure": 998,
        "sea_level": 998,
        "grnd_level": 983,
        "humidity": 96,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "light rain",
          "icon": "10n"
        }
      ],
      "clouds": {
        "all": 100
      },
      "wind": {
        "speed": 6.92,
        "deg": 222,
        "gust": 13.96
      },
      "visibility": 3025,
      "pop": 0.85,
      "rain": {
        "3h": 1.09
      },
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2022-02-21 18:00:00"
    },
    {
      "dt": 1645477200,
      "main": {
        "temp": 277.88,
        "feels_like": 273.54,
        "temp_min": 277.88,
        "temp_max": 277.88,
        "pressure": 999,
        "sea_level": 999,
        "grnd_level": 985,
        "humidity": 93,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "light rain",
          "icon": "10n"
        }
      ],
      "clouds": {
        "all": 100
      },
      "wind": {
        "speed": 6.41,
        "deg": 236,
        "gust": 13.53
      },
      "visibility": 10000,
      "pop": 0.97,
      "rain": {
        "3h": 0.85
      },
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2022-02-21 21:00:00"
    },
    {
      "dt": 1645488000,
      "main": {
        "temp": 277.49,
        "feels_like": 273.57,
        "temp_min": 277.49,
        "temp_max": 277.49,
        "pressure": 1000,
        "sea_level": 1000,
        "grnd_level": 986,
        "humidity": 90,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {
        "all": 100
      },
      "wind": {
        "speed": 5.18,
        "deg": 235,
        "gust": 11.18
      },
      "visibility": 10000,
      "pop": 0.75,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2022-02-22 00:00:00"
    },
    {
      "dt": 1645498800,
      "main": {
        "temp": 275.47,
        "feels_like": 272.02,
        "temp_min": 275.47,
        "temp_max": 275.47,
        "pressure": 1001,
        "sea_level": 1001,
        "grnd_level": 986,
        "humidity": 93,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {
        "all": 100
      },
      "wind": {
        "speed": 3.55,
        "deg": 219,
        "gust": 8.14
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2022-02-22 03:00:00"
    },
    {
      "dt": 1645509600,
      "main": {
        "temp": 274.98,
        "feels_like": 271.1,
        "temp_min": 274.98,
        "temp_max": 274.98,
        "pressure": 1002,
        "sea_level": 1002,
        "grnd_level": 987,
        "humidity": 90,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {
        "all": 87
      },
      "wind": {
        "speed": 4.02,
        "deg": 207,
        "gust": 9.14
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2022-02-22 06:00:00"
    },
    {
      "dt": 1645520400,
      "main": {
        "temp": 278.83,
        "feels_like": 274.83,
        "temp_min": 278.83,
        "temp_max": 278.83,
        "pressure": 1002,
        "sea_level": 1002,
        "grnd_level": 988,
        "humidity": 67,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 801,
          "main": "Clouds",
          "description": "few clouds",
          "icon": "02d"
        }
      ],
      "clouds": {
        "all": 16
      },
      "wind": {
        "speed": 6.2,
        "deg": 215,
        "gust": 11.14
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2022-02-22 09:00:00"
    },
    {
      "dt": 1645531200,
      "main": {
        "temp": 280.57,
        "feels_like": 276.74,
        "temp_min": 280.57,
        "temp_max": 280.57,
        "pressure": 1002,
        "sea_level": 1002,
        "grnd_level": 988,
        "humidity": 57,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 801,
          "main": "Clouds",
          "description": "few clouds",
          "icon": "02d"
        }
      ],
      "clouds": {
        "all": 12
      },
      "wind": {
        "speed": 7.1,
        "deg": 235,
        "gust": 11.57
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2022-02-22 12:00:00"
    },
    {
      "dt": 1645542000,
      "main": {
        "temp": 277.37,
        "feels_like": 272.83,
        "temp_min": 277.37,
        "temp_max": 277.37,
        "pressure": 1004,
        "sea_level": 1004,
        "grnd_level": 990,
        "humidity": 74,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "clouds": {
        "all": 75
      },
      "wind": {
        "speed": 6.56,
        "deg": 253,
        "gust": 11.86
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2022-02-22 15:00:00"
    },
    {
      "dt": 1645552800,
      "main": {
        "temp": 276,
        "feels_like": 271.43,
        "temp_min": 276,
        "temp_max": 276,
        "pressure": 1006,
        "sea_level": 1006,
        "grnd_level": 992,
        "humidity": 87,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "light rain",
          "icon": "10n"
        }
      ],
      "clouds": {
        "all": 86
      },
      "wind": {
        "speed": 5.74,
        "deg": 263,
        "gust": 10.42
      },
      "visibility": 10000,
      "pop": 0.2,
      "rain": {
        "3h": 0.12
      },
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2022-02-22 18:00:00"
    },
    {
      "dt": 1645563600,
      "main": {
        "temp": 274.1,
        "feels_like": 269.63,
        "temp_min": 274.1,
        "temp_max": 274.1,
        "pressure": 1008,
        "sea_level": 1008,
        "grnd_level": 993,
        "humidity": 85,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04n"
        }
      ],
      "clouds": {
        "all": 51
      },
      "wind": {
        "speed": 4.63,
        "deg": 257,
        "gust": 10.18
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2022-02-22 21:00:00"
    },
    {
      "dt": 1645574400,
      "main": {
        "temp": 273.32,
        "feels_like": 268.53,
        "temp_min": 273.32,
        "temp_max": 273.32,
        "pressure": 1009,
        "sea_level": 1009,
        "grnd_level": 994,
        "humidity": 84,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03n"
        }
      ],
      "clouds": {
        "all": 32
      },
      "wind": {
        "speed": 4.85,
        "deg": 263,
        "gust": 10.31
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2022-02-23 00:00:00"
    },
    {
      "dt": 1645585200,
      "main": {
        "temp": 272.28,
        "feels_like": 267.64,
        "temp_min": 272.28,
        "temp_max": 272.28,
        "pressure": 1011,
        "sea_level": 1011,
        "grnd_level": 996,
        "humidity": 82,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 801,
          "main": "Clouds",
          "description": "few clouds",
          "icon": "02n"
        }
      ],
      "clouds": {
        "all": 15
      },
      "wind": {
        "speed": 4.22,
        "deg": 275,
        "gust": 8.53
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2022-02-23 03:00:00"
    },
    {
      "dt": 1645596000,
      "main": {
        "temp": 272.38,
        "feels_like": 267.87,
        "temp_min": 272.38,
        "temp_max": 272.38,
        "pressure": 1013,
        "sea_level": 1013,
        "grnd_level": 997,
        "humidity": 82,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03d"
        }
      ],
      "clouds": {
        "all": 38
      },
      "wind": {
        "speed": 4.07,
        "deg": 277,
        "gust": 6.76
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2022-02-23 06:00:00"
    },
    {
      "dt": 1645606800,
      "main": {
        "temp": 273.55,
        "feels_like": 269.63,
        "temp_min": 273.55,
        "temp_max": 273.55,
        "pressure": 1014,
        "sea_level": 1014,
        "grnd_level": 999,
        "humidity": 65,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {
        "all": 100
      },
      "wind": {
        "speed": 3.62,
        "deg": 276,
        "gust": 4.75
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2022-02-23 09:00:00"
    },
    {
      "dt": 1645617600,
      "main": {
        "temp": 275.16,
        "feels_like": 271.8,
        "temp_min": 275.16,
        "temp_max": 275.16,
        "pressure": 1014,
        "sea_level": 1014,
        "grnd_level": 999,
        "humidity": 55,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {
        "all": 100
      },
      "wind": {
        "speed": 3.33,
        "deg": 274,
        "gust": 4.59
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2022-02-23 12:00:00"
    },
    {
      "dt": 1645628400,
      "main": {
        "temp": 273.99,
        "feels_like": 272.48,
        "temp_min": 273.99,
        "temp_max": 273.99,
        "pressure": 1016,
        "sea_level": 1016,
        "grnd_level": 1000,
        "humidity": 64,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {
        "all": 100
      },
      "wind": {
        "speed": 1.42,
        "deg": 269,
        "gust": 1.42
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2022-02-23 15:00:00"
    },
    {
      "dt": 1645639200,
      "main": {
        "temp": 272.75,
        "feels_like": 272.75,
        "temp_min": 272.75,
        "temp_max": 272.75,
        "pressure": 1017,
        "sea_level": 1017,
        "grnd_level": 1002,
        "humidity": 68,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04n"
        }
      ],
      "clouds": {
        "all": 72
      },
      "wind": {
        "speed": 1.07,
        "deg": 143,
        "gust": 1.04
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2022-02-23 18:00:00"
    },
    {
      "dt": 1645650000,
      "main": {
        "temp": 272.66,
        "feels_like": 270.25,
        "temp_min": 272.66,
        "temp_max": 272.66,
        "pressure": 1018,
        "sea_level": 1018,
        "grnd_level": 1003,
        "humidity": 71,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04n"
        }
      ],
      "clouds": {
        "all": 58
      },
      "wind": {
        "speed": 1.9,
        "deg": 162,
        "gust": 2.04
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2022-02-23 21:00:00"
    },
    {
      "dt": 1645660800,
      "main": {
        "temp": 272.72,
        "feels_like": 270.75,
        "temp_min": 272.72,
        "temp_max": 272.72,
        "pressure": 1020,
        "sea_level": 1020,
        "grnd_level": 1004,
        "humidity": 73,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04n"
        }
      ],
      "clouds": {
        "all": 79
      },
      "wind": {
        "speed": 1.6,
        "deg": 170,
        "gust": 1.61
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2022-02-24 00:00:00"
    },
    {
      "dt": 1645671600,
      "main": {
        "temp": 272.36,
        "feels_like": 269.96,
        "temp_min": 272.36,
        "temp_max": 272.36,
        "pressure": 1021,
        "sea_level": 1021,
        "grnd_level": 1005,
        "humidity": 77,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {
        "all": 89
      },
      "wind": {
        "speed": 1.86,
        "deg": 155,
        "gust": 1.8
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2022-02-24 03:00:00"
    },
    {
      "dt": 1645682400,
      "main": {
        "temp": 273.18,
        "feels_like": 273.18,
        "temp_min": 273.18,
        "temp_max": 273.18,
        "pressure": 1023,
        "sea_level": 1023,
        "grnd_level": 1007,
        "humidity": 79,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {
        "all": 89
      },
      "wind": {
        "speed": 1.1,
        "deg": 177,
        "gust": 1.58
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2022-02-24 06:00:00"
    },
    {
      "dt": 1645693200,
      "main": {
        "temp": 275.75,
        "feels_like": 274.27,
        "temp_min": 275.75,
        "temp_max": 275.75,
        "pressure": 1024,
        "sea_level": 1024,
        "grnd_level": 1008,
        "humidity": 75,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "clouds": {
        "all": 80
      },
      "wind": {
        "speed": 1.56,
        "deg": 161,
        "gust": 1.9
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2022-02-24 09:00:00"
    },
    {
      "dt": 1645704000,
      "main": {
        "temp": 276.74,
        "feels_like": 274.85,
        "temp_min": 276.74,
        "temp_max": 276.74,
        "pressure": 1024,
        "sea_level": 1024,
        "grnd_level": 1008,
        "humidity": 77,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "clouds": {
        "all": 80
      },
      "wind": {
        "speed": 2.02,
        "deg": 209,
        "gust": 2.53
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2022-02-24 12:00:00"
    },
    {
      "dt": 1645714800,
      "main": {
        "temp": 274.71,
        "feels_like": 272.51,
        "temp_min": 274.71,
        "temp_max": 274.71,
        "pressure": 1024,
        "sea_level": 1024,
        "grnd_level": 1008,
        "humidity": 96,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {
        "all": 98
      },
      "wind": {
        "speed": 2,
        "deg": 202,
        "gust": 3.04
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2022-02-24 15:00:00"
    },
    {
      "dt": 1645725600,
      "main": {
        "temp": 274.33,
        "feels_like": 272,
        "temp_min": 274.33,
        "temp_max": 274.33,
        "pressure": 1024,
        "sea_level": 1024,
        "grnd_level": 1009,
        "humidity": 99,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {
        "all": 99
      },
      "wind": {
        "speed": 2.06,
        "deg": 190,
        "gust": 4.13
      },
      "visibility": 157,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2022-02-24 18:00:00"
    },
    {
      "dt": 1645736400,
      "main": {
        "temp": 273.83,
        "feels_like": 270.63,
        "temp_min": 273.83,
        "temp_max": 273.83,
        "pressure": 1023,
        "sea_level": 1023,
        "grnd_level": 1008,
        "humidity": 96,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {
        "all": 95
      },
      "wind": {
        "speed": 2.82,
        "deg": 165,
        "gust": 5.83
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2022-02-24 21:00:00"
    },
    {
      "dt": 1645747200,
      "main": {
        "temp": 274.24,
        "feels_like": 270.44,
        "temp_min": 274.24,
        "temp_max": 274.24,
        "pressure": 1022,
        "sea_level": 1022,
        "grnd_level": 1007,
        "humidity": 89,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {
        "all": 97
      },
      "wind": {
        "speed": 3.66,
        "deg": 179,
        "gust": 9.17
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2022-02-25 00:00:00"
    },
    {
      "dt": 1645758000,
      "main": {
        "temp": 273.04,
        "feels_like": 269.21,
        "temp_min": 273.04,
        "temp_max": 273.04,
        "pressure": 1022,
        "sea_level": 1022,
        "grnd_level": 1006,
        "humidity": 92,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {
        "all": 90
      },
      "wind": {
        "speed": 3.36,
        "deg": 181,
        "gust": 8.9
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2022-02-25 03:00:00"
    },
    {
      "dt": 1645768800,
      "main": {
        "temp": 275.05,
        "feels_like": 271.09,
        "temp_min": 275.05,
        "temp_max": 275.05,
        "pressure": 1021,
        "sea_level": 1021,
        "grnd_level": 1006,
        "humidity": 75,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {
        "all": 95
      },
      "wind": {
        "speed": 4.18,
        "deg": 180,
        "gust": 9.99
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2022-02-25 06:00:00"
    },
    {
      "dt": 1645779600,
      "main": {
        "temp": 277.12,
        "feels_like": 272.76,
        "temp_min": 277.12,
        "temp_max": 277.12,
        "pressure": 1021,
        "sea_level": 1021,
        "grnd_level": 1006,
        "humidity": 67,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {
        "all": 100
      },
      "wind": {
        "speed": 5.95,
        "deg": 203,
        "gust": 9.93
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2022-02-25 09:00:00"
    },
    {
      "dt": 1645790400,
      "main": {
        "temp": 278.39,
        "feels_like": 274.77,
        "temp_min": 278.39,
        "temp_max": 278.39,
        "pressure": 1019,
        "sea_level": 1019,
        "grnd_level": 1004,
        "humidity": 63,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {
        "all": 100
      },
      "wind": {
        "speed": 5.04,
        "deg": 204,
        "gust": 8.57
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2022-02-25 12:00:00"
    },
    {
      "dt": 1645801200,
      "main": {
        "temp": 276.95,
        "feels_like": 274.12,
        "temp_min": 276.95,
        "temp_max": 276.95,
        "pressure": 1019,
        "sea_level": 1019,
        "grnd_level": 1004,
        "humidity": 71,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {
        "all": 100
      },
      "wind": {
        "speed": 3.12,
        "deg": 199,
        "gust": 6.49
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2022-02-25 15:00:00"
    },
    {
      "dt": 1645812000,
      "main": {
        "temp": 275.28,
        "feels_like": 272.48,
        "temp_min": 275.28,
        "temp_max": 275.28,
        "pressure": 1020,
        "sea_level": 1020,
        "grnd_level": 1005,
        "humidity": 80,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {
        "all": 100
      },
      "wind": {
        "speed": 2.68,
        "deg": 198,
        "gust": 4.44
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2022-02-25 18:00:00"
    },
    {
      "dt": 1645822800,
      "main": {
        "temp": 274.81,
        "feels_like": 271.96,
        "temp_min": 274.81,
        "temp_max": 274.81,
        "pressure": 1021,
        "sea_level": 1021,
        "grnd_level": 1006,
        "humidity": 82,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {
        "all": 100
      },
      "wind": {
        "speed": 2.64,
        "deg": 200,
        "gust": 3.83
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2022-02-25 21:00:00"
    },
    {
      "dt": 1645833600,
      "main": {
        "temp": 274.55,
        "feels_like": 271.7,
        "temp_min": 274.55,
        "temp_max": 274.55,
        "pressure": 1021,
        "sea_level": 1021,
        "grnd_level": 1006,
        "humidity": 82,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {
        "all": 100
      },
      "wind": {
        "speed": 2.59,
        "deg": 199,
        "gust": 3.51
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2022-02-26 00:00:00"
    },
    {
      "dt": 1645844400,
      "main": {
        "temp": 274.82,
        "feels_like": 272.28,
        "temp_min": 274.82,
        "temp_max": 274.82,
        "pressure": 1021,
        "sea_level": 1021,
        "grnd_level": 1006,
        "humidity": 82,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {
        "all": 100
      },
      "wind": {
        "speed": 2.33,
        "deg": 231,
        "gust": 4.29
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2022-02-26 03:00:00"
    },
    {
      "dt": 1645855200,
      "main": {
        "temp": 274.99,
        "feels_like": 272.51,
        "temp_min": 274.99,
        "temp_max": 274.99,
        "pressure": 1023,
        "sea_level": 1023,
        "grnd_level": 1008,
        "humidity": 94,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {
        "all": 100
      },
      "wind": {
        "speed": 2.3,
        "deg": 281,
        "gust": 5.48
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2022-02-26 06:00:00"
    }
  ],
  "city": {
    "id": 619762,
    "name": "Yakubovka",
    "coord": {
      "lat": 52.4508,
      "lon": 31.0224
    },
    "country": "BY",
    "population": 0,
    "timezone": 10800,
    "sunrise": 1645419626,
    "sunset": 1645456741
  }
}
''';
