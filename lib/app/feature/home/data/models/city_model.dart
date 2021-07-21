import 'dart:convert';

import 'package:clim_tur/app/feature/home/domain/entity/city_entity.dart';

class CityModel extends CityEntity {
  CityModel({
    required int id,
    required String name,
    required String country,
    required int timezone,
  }) : super(
          id: id,
          name: name,
          country: country,
          timezone: timezone,
        );

  factory CityModel.fromMap(Map<String, dynamic> map) {
    return CityModel(
      id: map['id'] as int,
      name: map['name'] as String,
      country: map['country'] as String,
      timezone: map['timezone'] as int,
    );
  }

  factory CityModel.fromJson(String source) =>
      CityModel.fromMap(jsonDecode(source) as Map<String, dynamic>);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'country': country,
      'timezone': timezone,
    };
  }

  String toJson() => json.encode(toMap());

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
