import 'dart:convert';

import 'package:clim_tur/app/feature/home/data/models/weathe_forecast_model.dart';
import 'package:clim_tur/app/feature/home/data/models/weather_model.dart';
import 'package:clim_tur/app/feature/home/domain/entity/clime_entity.dart';
import 'package:flutter/foundation.dart';

class ClimeModel extends ClimeEntity {
  ClimeModel({
    required int id,
    required String name,
    required int cod,
    required List<WeatherModel> weather,
    required WeatherForecastModel weatherForecast,
  }) : super(
          cod: cod,
          id: id,
          name: name,
          weather: weather,
          weatherForecast: weatherForecast,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'cod': cod,
      'weather': weather.map((x) => x.toMap()).toList(),
      'main': weatherForecast.toMap(),
    };
  }

  factory ClimeModel.fromMap(Map<String, dynamic> map) {
    return ClimeModel(
      id: map['id'],
      name: map['name'],
      cod: map['cod'],
      weather: List<WeatherModel>.from(
          map['weather']?.map((x) => WeatherModel.fromMap(x))),
      weatherForecast: WeatherForecastModel.fromMap(map['main']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ClimeModel.fromJson(String source) =>
      ClimeModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ClimeEntity(id: $id, name: $name, cod: $cod, weather: $weather, main: $weatherForecast)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ClimeEntity &&
        other.id == id &&
        other.name == name &&
        other.cod == cod &&
        listEquals(other.weather, weather) &&
        other.weatherForecast == weatherForecast;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        cod.hashCode ^
        weather.hashCode ^
        weatherForecast.hashCode;
  }
}
