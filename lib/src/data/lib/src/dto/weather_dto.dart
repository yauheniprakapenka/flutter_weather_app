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
    if (json['weather'] != null) {
      weather = <_WeatherDto>[];
      json['weather'].forEach((v) {
        weather?.add(_WeatherDto.fromJson(v));
      });
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
  int? id;
  String? main;
  String? description;
  String? icon;

  _WeatherDto({this.id, this.main, this.description, this.icon});

  _WeatherDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }
}

class _MainDto {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;
  int? seaLevel;
  int? grndLevel;

  _MainDto({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
    this.seaLevel,
    this.grndLevel,
  });

  _MainDto.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
    seaLevel = json['sea_level'];
    grndLevel = json['grnd_level'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['temp'] = temp;
    data['feels_like'] = feelsLike;
    data['temp_min'] = tempMin;
    data['temp_max'] = tempMax;
    data['pressure'] = pressure;
    data['humidity'] = humidity;
    data['sea_level'] = seaLevel;
    data['grnd_level'] = grndLevel;
    return data;
  }
}

class _WindDto {
  double? speed;
  int? deg;

  _WindDto({this.speed, this.deg});

  _WindDto.fromJson(Map<String, dynamic> json) {
    speed = json['speed'].toDouble();
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
  int? type;
  int? id;
  String? country;
  int? sunrise;
  int? sunset;

  _Sys({this.type, this.id, this.country, this.sunrise, this.sunset});

  _Sys.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    country = json['country'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }
}
