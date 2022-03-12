class ForecastDto {
  final List<_ListDto>? list;
  final _CityDto? city;

  ForecastDto({this.list, this.city});

  factory ForecastDto.fromJson(Map<String, dynamic> json) {
    final data = List<Map<String, dynamic>>.from(json['list']);
    final city = _CityDto.fromJson(json['city']);

    final list = data.map((e) {
      return _ListDto.fromJson(e);
    }).toList();
    return ForecastDto(
      list: list,
      city: city,
    );
  }
}

class _ListDto {
  final _MainDto? main;
  final String? dtText;
  final _WeatherDto? weatherDto;

  _ListDto({
    this.main,
    this.dtText,
    this.weatherDto,
  });

  factory _ListDto.fromJson(Map<String, dynamic> json) {
    return _ListDto(
      main: _MainDto.fromJson(json['main']),
      dtText: json['dt_txt'],
      weatherDto: _WeatherDto.fromJson(json['weather'][0]),
    );
  }
}

class _MainDto {
  final double? temp;

  _MainDto({
    this.temp,
  });

  factory _MainDto.fromJson(Map<String, dynamic> json) {
    return _MainDto(
      temp: json['temp'].toDouble(),
    );
  }
}

class _WeatherDto {
  final String main;
  final String icon;

  _WeatherDto({
    required this.main,
    required this.icon,
  });

  factory _WeatherDto.fromJson(Map<String, dynamic> json) {
    return _WeatherDto(
      main: json['main'],
      icon: json['icon'],
    );
  }
}

class _CityDto {
  final String? city;

  _CityDto({
    this.city,
  });

  factory _CityDto.fromJson(Map<String, dynamic> json) {
    return _CityDto(city: json['name']);
  }
}
