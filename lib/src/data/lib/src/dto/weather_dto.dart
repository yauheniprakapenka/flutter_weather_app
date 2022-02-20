class WeatherDto {
  List<_Weather>? weather;
  _Main? main;
  _Wind? wind;
  _Clouds? clouds;
  _Rain? rain;
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
      weather = <_Weather>[];
      json['weather'].forEach((v) {
        weather?.add(_Weather.fromJson(v));
      });
    }
    main = json['main'] != null ? _Main.fromJson(json['main']) : null;
    wind = json['wind'] != null ? _Wind.fromJson(json['wind']) : null;
    clouds = json['clouds'] != null ? _Clouds.fromJson(json['clouds']) : null;
    rain = json['rain'] != null ? _Rain.fromJson(json['rain']) : null;
    sys = json['sys'] != null ? _Sys.fromJson(json['sys']) : null;
    name = json['name'];
  }
}

class _Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  _Weather({this.id, this.main, this.description, this.icon});

  _Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }
}

class _Main {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;
  int? seaLevel;
  int? grndLevel;

  _Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
    this.seaLevel,
    this.grndLevel,
  });

  _Main.fromJson(Map<String, dynamic> json) {
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

class _Wind {
  double? speed;
  int? deg;

  _Wind({this.speed, this.deg});

  _Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'].toDouble();
    deg = json['deg'];
  }
}

class _Clouds {
  int? all;

  _Clouds({this.all});

  _Clouds.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }
}

class _Rain {
  double? oneHour;

  _Rain({this.oneHour});

  _Rain.fromJson(Map<String, dynamic> json) {
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
