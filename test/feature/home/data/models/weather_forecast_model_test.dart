import 'dart:convert';

import 'package:clim_tur/app/feature/home/data/models/weathe_forecast_model.dart';
import 'package:clim_tur/app/feature/home/domain/entity/weathe_forecast_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tMapWeatherForecastModel = <String, dynamic>{
    "temp": 27.05,
    "feels_like": 27.06,
    "temp_min": 27.05,
    "temp_max": 27.05,
    "pressure": 1019,
    "humidity": 43,
    "sea_level": 1019,
    "grnd_level": 994
  };
  final tInstanceWeatherForecastModel =
      WeatherForecastModel.fromMap(tMapWeatherForecastModel);

  test('Deve retornar uma instancia de WeatherForecastEntity ', () {
    expect(tInstanceWeatherForecastModel, isA<WeatherForecastEntity>());
  });

  test('Deve retornar um modelo valido(Json)', () {
    final result =
        WeatherForecastModel.fromJson(jsonEncode(tMapWeatherForecastModel));

    expect(result, isA<WeatherForecastModel>());
  });

  test('Deve retornar um modelo valido(Map)', () {
    final result = WeatherForecastModel.fromMap(tMapWeatherForecastModel);

    expect(result, isA<WeatherForecastModel>());
  });
  test('Deve retornar um Json', () {
    final result = tInstanceWeatherForecastModel.toJson();

    expect(result, jsonEncode(tInstanceWeatherForecastModel.toMap()));
  });

  test('Deve retornar um Map', () {
    final result = tInstanceWeatherForecastModel.toMap();

    expect(result, tMapWeatherForecastModel);
  });
}
