class WeatherDto {
  List<_WeatherDto>? weather;
  _MainDto? main;
  _WindDto? wind;
  _CloudsDto? clouds;
  _RainDto? rain;
  _Sys? sys;
  String? name;

  WeatherDto({
    this.weather,
    this.main,
    this.wind,
    this.clouds,
    this.rain,
    this.sys,
    this.name,
  });

  WeatherDto.fromJson(Map<String, dynamic> json) {
    final Iterable _weather = json['weather'];
    if (json['weather'] != null) {
      weather = <_WeatherDto>[];
      for (final e in _weather) {
        weather?.add(_WeatherDto.fromJson(e));
      }
    }
    main = json['main'] != null ? _MainDto.fromJson(json['main']) : null;
    wind = json['wind'] != null ? _WindDto.fromJson(json['wind']) : null;
    clouds = json['clouds'] != null ? _CloudsDto.fromJson(json['clouds']) : null;
    rain = json['rain'] != null ? _RainDto.fromJson(json['rain']) : null;
    sys = json['sys'] != null ? _Sys.fromJson(json['sys']) : null;
    name = json['name'];
  }
}

class _WeatherDto {
  String? main;
  String? description;
  String? icon;

  _WeatherDto({this.main, this.description, this.icon});

  _WeatherDto.fromJson(Map<String, dynamic> json) {
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }
}

class _MainDto {
  double? temp;
  int? pressure;
  int? humidity;

  _MainDto({
    this.temp,
    this.pressure,
    this.humidity,
  });

  _MainDto.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    pressure = json['pressure'];
    humidity = json['humidity'];
  }
}

class _WindDto {
  double? speed;
  int? deg;

  _WindDto({this.speed, this.deg});

  _WindDto.fromJson(Map<String, dynamic> json) {
    final double _speed = json['speed']; 
    speed = _speed;
    deg = json['deg'];
  }
}

class _CloudsDto {
  int? all;

  _CloudsDto({this.all});

  _CloudsDto.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }
}

class _RainDto {
  double? oneHour;

  _RainDto({this.oneHour});

  _RainDto.fromJson(Map<String, dynamic> json) {
    oneHour = json['1h'];
  }
}

class _Sys {
  String? country;

  _Sys({this.country});

  _Sys.fromJson(Map<String, dynamic> json) {
    country = json['country'];
  }
}
