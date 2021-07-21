class WeatherEntity {
  WeatherEntity({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });
  final int id;
  final String main;
  final String description;
  final String icon;

  WeatherEntity copyWith({
    int? id,
    String? main,
    String? description,
    String? icon,
  }) {
    return WeatherEntity(
      id: id ?? this.id,
      main: main ?? this.main,
      description: description ?? this.description,
      icon: icon ?? this.icon,
    );
  }
}
