import 'dart:convert';

import 'package:clim_tur/app/feature/home/data/models/city_model.dart';
import 'package:clim_tur/app/feature/home/domain/entity/city_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tInstanceCityModel =
      CityModel(country: 'BR', id: 1155, name: 'Sousa', timezone: 1115);
  final tMapCityModel = <String, dynamic>{
    'country': 'BR',
    'id': 1155,
    'name': 'Sousa',
    'timezone': 1115
  };

  test('Deve retornar uma instancia de CityEntity ', () {
    expect(tInstanceCityModel, isA<CityEntity>());
  });

  test('Deve retornar um modelo valido(Json)', () {
    final result = CityModel.fromJson(jsonEncode(tMapCityModel));

    expect(result, isA<CityModel>());
  });

  test('Deve retornar um modelo valido(Map)', () {
    final result = CityModel.fromMap(tMapCityModel);

    expect(result, isA<CityModel>());
  });
  test('Deve retornar um Json', () {
    final result = tInstanceCityModel.toJson();

    expect(result, jsonEncode(tInstanceCityModel.toMap()));
  });

  test('Deve retornar um Map', () {
    final result = tInstanceCityModel.toMap();

    expect(result, tMapCityModel);
  });
}
