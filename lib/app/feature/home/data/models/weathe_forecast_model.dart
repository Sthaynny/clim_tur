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

  factory WeatherForecastModel.fromJson(String source) =>
      WeatherForecastModel.fromMap(jsonDecode(source) as Map<String, dynamic>);

  factory WeatherForecastModel.fromMap(Map<String, dynamic> map) {
    return WeatherForecastModel(
      temp: map['temp'] as double,
      feelsLike: map['feelsLike'] as double,
      tempMin: map['tempMin'] as double,
      tempMax: map['tempMax'] as double,
      pressure: map['pressure'] as int,
      humidity: map['humidity'] as int,
      seaLevel: map['seaLevel'] as int,
      grndLevel: map['grndLevel'] as int,
    );
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

  String toJson() => json.encode(toMap());
}
