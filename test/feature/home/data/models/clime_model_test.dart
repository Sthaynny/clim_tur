import 'dart:convert';

import 'package:clim_tur/app/feature/home/data/models/clime_model.dart';
import 'package:clim_tur/app/feature/home/data/models/weathe_forecast_model.dart';
import 'package:clim_tur/app/feature/home/domain/entity/clime_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tInstanceClimeModel = ClimeModel(
    cod: 111,
    id: 44,
    name: 'asda',
    weather: [],
    weatherForecast: WeatherForecastModel(
      temp: 115,
      feelsLike: 15651,
      grndLevel: 545,
      humidity: 4554,
      pressure: 4545,
      seaLevel: 54545,
      tempMax: 4554,
      tempMin: 45545,
    ),
  );
  final tMapClimeModel = tInstanceClimeModel.toMap();

  test('Deve retornar uma instancia de ClimeEntity ', () {
    expect(tInstanceClimeModel, isA<ClimeEntity>());
  });

  test('Deve retornar um modelo valido(Json)', () {
    final result = ClimeModel.fromJson(jsonEncode(tMapClimeModel));

    expect(result, isA<ClimeModel>());
  });

  test('Deve retornar um modelo valido(Map)', () {
    final result = ClimeModel.fromMap(tMapClimeModel);

    expect(result, isA<ClimeModel>());
  });
  test('Deve retornar um Json', () {
    final result = tInstanceClimeModel.toJson();

    expect(result, jsonEncode(tInstanceClimeModel.toMap()));
  });

  test('Deve retornar um Map', () {
    final result = tInstanceClimeModel.toMap();

    expect(result, tMapClimeModel);
  });
}
