import 'dart:convert';

import 'package:clim_tur/app/feature/home/domain/entity/city_entity.dart';

class CityModel extends CityEntity {
  CityModel({
    required int id,
    required String name,
    required String country,
    required int timezone,
  }) : super(id: id, name: name, country: country, timezone: timezone);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'country': country,
      'timezone': timezone,
    };
  }

  factory CityModel.fromMap(Map<String, dynamic> map) {
    return CityModel(
      id: map['id'],
      name: map['name'],
      country: map['country'],
      timezone: map['timezone'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CityModel.fromJson(String source) =>
      CityModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CityEntity(id: $id, name: $name, country: $country, timezone: $timezone)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CityEntity &&
        other.id == id &&
        other.name == name &&
        other.country == country &&
        other.timezone == timezone;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ country.hashCode ^ timezone.hashCode;
  }
}
