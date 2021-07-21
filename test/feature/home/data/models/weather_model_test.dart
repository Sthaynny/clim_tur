import 'dart:convert';

import 'package:clim_tur/app/feature/home/data/models/weather_model.dart';
import 'package:clim_tur/app/feature/home/domain/entity/weather_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tMapWeatherModel = <String, dynamic>{
    "id": 800,
    "main": "Clear",
    "description": "céu limpo",
    "icon": "01d"
  };
  final tInstanceWeatherModel = WeatherModel.fromMap(tMapWeatherModel);

  test('Deve retornar uma instancia de WeatherEntity ', () {
    expect(tInstanceWeatherModel, isA<WeatherEntity>());
  });

  test('Deve retornar um modelo valido(Json)', () {
    final result = WeatherModel.fromJson(jsonEncode(tMapWeatherModel));

    expect(result, isA<WeatherModel>());
  });

  test('Deve retornar um modelo valido(Map)', () {
    final result = WeatherModel.fromMap(tMapWeatherModel);

    expect(result, isA<WeatherModel>());
  });
  test('Deve retornar um Json', () {
    final result = tInstanceWeatherModel.toJson();

    expect(result, jsonEncode(tInstanceWeatherModel.toMap()));
  });

  test('Deve retornar um Map', () {
    final result = tInstanceWeatherModel.toMap();

    expect(result, tMapWeatherModel);
  });
}
