import 'dart:convert';

import 'package:clim_tur/app/feature/home/domain/entity/weather_forecast_entity.dart';

class WeatherForecastModel extends WeatherForecastEntity {
  WeatherForecastModel({
    double? temp,
    double? feelsLike,
    double? tempMin,
    double? tempMax,
    int? pressure,
    int? humidity,
    int? seaLevel,
    int? grndLevel,
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
      temp: map['temp'],
      feelsLike: map['feelsLike'],
      tempMin: map['temp_min'],
      tempMax: map['temp_max'],
      pressure: map['pressure'],
      humidity: map['humidity'],
      seaLevel: map['seaLevel'],
      grndLevel: map['grndLevel'],
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
      'temp_min': tempMin,
      'temp_max': tempMax,
      'pressure': pressure,
      'humidity': humidity,
      'seaLevel': seaLevel,
      'grndLevel': grndLevel,
    };
  }

  String toJson() => json.encode(toMap());
}
