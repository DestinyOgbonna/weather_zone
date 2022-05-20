// To parse this JSON data, do
//
//     final weather = weatherFromJson(jsonString);

class Weather {
  Weather({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  Coord? coord;
  List<WeatherElement>? weather;
  String? base;
  Main? main;
  num? visibility;
  Wind? wind;
  Clouds? clouds;
  num? dt;
  Sys? sys;
  num? timezone;
  num? id;
  String? name;
  num? cod;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        coord: Coord.fromJson(json["coord"] ?? {}),
        weather: List<WeatherElement>.from(
            json["weather"].map((x) => WeatherElement.fromJson(x))),
        base: json["base"] ?? ' No data',
        main: Main.fromJson(json["main"]),
        visibility: json["visibility"] ?? 0,
        wind: Wind.fromJson(json["wind"] ?? {}),
        clouds: Clouds.fromJson(json["clouds"] ?? {}),
        dt: json["dt"],
        sys: Sys.fromJson(json["sys"] ?? {}),
        timezone: json["timezone"],
        id: json["id"],
        name: json["name"],
        cod: json["cod"],
      );

  Map<String, dynamic> toJson() => {
        "coord": coord!,
        "weather": List<dynamic>.from(weather!.map((x) => x.toJson())),
        "base": base,
        "main": main!,
        "visibility": visibility,
        "wind": wind!,
        "clouds": clouds!,
        "dt": dt,
        "sys": sys!,
        "timezone": timezone,
        "id": id,
        "name": name,
        "cod": cod,
      };
}

class Clouds {
  Clouds({
    this.all,
  });

  num? all;

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "all": all,
      };
}

class Coord {
  Coord({
    this.lon,
    this.lat,
  });

  num? lon;
  num? lat;

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lon: json["lon"] ?? 0,
        lat: json["lat"]?? 0,
      );

  Map<String, dynamic> toJson() => {
        "lon": lon,
        "lat": lat,
      };
}

class Main {
  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
    this.seaLevel,
    this.grndLevel,
  });

  num? temp;
  num? feelsLike;
  num? tempMin;
  num? tempMax;
  num? pressure;
  num? humidity;
  num? seaLevel;
  num? grndLevel;

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json["temp"]?? 0,
        feelsLike: json["feels_like"]?? 0,
        tempMin: json["temp_min"]?? 0,
        tempMax: json["temp_max"]?? 0,
        pressure: json["pressure"]?? 0,
        humidity: json["humidity"]?? 0,
        seaLevel: json["sea_level"]?? 0,
        grndLevel: json["grnd_level"]?? 0,
      );

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "humidity": humidity,
        "sea_level": seaLevel,
        "grnd_level": grndLevel,
      };
}

class Sys {
  Sys({
    this.country,
    this.sunrise,
    this.sunset,
  });

  String? country;
  num? sunrise;
  num? sunset;

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        country: json["country"]?? 'No data',
        sunrise: json["sunrise"]?? 0,
        sunset: json["sunset"]?? 0,
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "sunrise": sunrise,
        "sunset": sunset,
      };
}

class WeatherElement {
  WeatherElement({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  num? id;
  String? main;
  String? description;
  String? icon;

  factory WeatherElement.fromJson(Map<String, dynamic> json) => WeatherElement(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };
}

class Wind {
  Wind({
    this.speed,
    this.deg,
    this.gust,
  });

  num? speed;
  num? deg;
  num? gust;

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"].toDouble(),
        deg: json["deg"],
        gust: json["gust"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
        "gust": gust,
      };
}
