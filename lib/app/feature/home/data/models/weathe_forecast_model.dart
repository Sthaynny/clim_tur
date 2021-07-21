import 'dart:convert';

import 'package:clim_tur/app/feature/home/domain/entity/weather_forecast_entity.dart';

class WeatherForecastModel extends WeatherForecastEntity {
  WeatherForecastModel({
    required double temp,
    required double feelsLike,
    required double tempMin,
    required double tempMax,
    required int pressure,
    required int humidity,
    required int seaLevel,
    required int grndLevel,
  }) : super(
          feelsLike: feelsLike,
          temp: temp,
          tempMax: tempMax,
          tempMin: tempMin,
          grndLevel: grndLevel,
          humidity: humidity,
          pressure: pressure,
          seaLevel: seaLevel,
        );

  @override
  String toString() {
    return 'WeatherForecastEntity(temp: $temp, feelsLike: $feelsLike, tempMin: $tempMin, tempMax: $tempMax, pressure: $pressure, humidity: $humidity, seaLevel: $seaLevel, grndLevel: $grndLevel)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeatherForecastEntity &&
        other.temp == temp &&
        other.feelsLike == feelsLike &&
        other.tempMin == tempMin &&
        other.tempMax == tempMax &&
        other.pressure == pressure &&
        other.humidity == humidity &&
        other.seaLevel == seaLevel &&
        other.grndLevel == grndLevel;
  }

  @override
  int get hashCode {
    return temp.hashCode ^
        feelsLike.hashCode ^
        tempMin.hashCode ^
        tempMax.hashCode ^
        pressure.hashCode ^
        humidity.hashCode ^
        seaLevel.hashCode ^
        grndLevel.hashCode;
  }

  Map<String, dynamic> toMap() {
    return {
      'temp': temp,
      'feelsLike': feelsLike,
      'tempMin': tempMin,
      'tempMax': tempMax,
      'pressure': pressure,
      'humidity': humidity,
      'seaLevel': seaLevel,
      'grndLevel': grndLevel,
    };
  }

  factory WeatherForecastModel.fromMap(Map<String, dynamic> map) {
    return WeatherForecastModel(
      temp: map['temp'],
      feelsLike: map['feelsLike'],
      tempMin: map['tempMin'],
      tempMax: map['tempMax'],
      pressure: map['pressure'],
      humidity: map['humidity'],
      seaLevel: map['seaLevel'],
      grndLevel: map['grndLevel'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherForecastModel.fromJson(String source) =>
      WeatherForecastModel.fromMap(json.decode(source));
}
