import 'dart:convert';

import 'package:clim_tur/app/feature/home/data/models/weathe_forecast_model.dart';
import 'package:clim_tur/app/feature/home/domain/entity/weather_forecast_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tInstanceWeatherForecastModel = WeatherForecastModel(
    temp: 27.05,
    feelsLike: 27.06,
    humidity: 43,
    pressure: 1019,
    seaLevel: 1019,
    tempMax: 27.05,
    tempMin: 27.05,
    grndLevel: 994,
  );

  test('Deve retornar uma instancia de WeatherForecastEntity ', () {
    expect(tInstanceWeatherForecastModel, isA<WeatherForecastEntity>());
  });

  test('Deve retornar um modelo valido(Json)', () {
    final result = WeatherForecastModel.fromJson(
        jsonEncode(tInstanceWeatherForecastModel.toMap()));

    expect(result, isA<WeatherForecastModel>());
  });

  test('Deve retornar um modelo valido(Map)', () {
    final result =
        WeatherForecastModel.fromMap(tInstanceWeatherForecastModel.toMap());

    expect(result, isA<WeatherForecastModel>());
  });
  test('Deve retornar um Json', () {
    final result = tInstanceWeatherForecastModel.toJson();

    expect(result, jsonEncode(tInstanceWeatherForecastModel.toMap()));
  });

  test('Deve retornar um Map', () {
    final result = tInstanceWeatherForecastModel.toMap();

    expect(result, isA<Map>());
  });
}
