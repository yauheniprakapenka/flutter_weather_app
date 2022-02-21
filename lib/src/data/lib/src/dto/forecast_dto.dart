class ForecastDto {
  List<_ListDto>? list;

  ForecastDto({this.list});

  factory ForecastDto.fromJson(Map<String, dynamic> json) {
    final data = List<Map<String, dynamic>>.from(json['list']);
    final list = data.map((e) {
      return _ListDto.fromJson(e);
    }).toList();
    return ForecastDto(list: list);
  }
}

class _ListDto {
  _MainDto? main;
  String? dtText;
  _WeatherDto? weatherDto;

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
  double? temp;

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
  String main;
  String icon;

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
