import 'dart:convert';

import 'package:clim_tur/app/feature/home/domain/entity/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  WeatherModel({
    required int id,
    required String main,
    required String description,
    required String icon,
  }) : super(
          id: id,
          main: main,
          description: description,
          icon: icon,
        );

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      id: map['id'] as int,
      main: map['main'] as String,
      description: map['description'] as String,
      icon: map['icon'] as String,
    );
  }

  factory WeatherModel.fromJson(String source) =>
      WeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'main': main,
      'description': description,
      'icon': icon,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return '''WeatherEntity(id: $id, main: $main, description: $description, icon: $icon)''';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeatherEntity &&
        other.id == id &&
        other.main == main &&
        other.description == description &&
        other.icon == icon;
  }

  @override
  int get hashCode {
    return id.hashCode ^ main.hashCode ^ description.hashCode ^ icon.hashCode;
  }
}
