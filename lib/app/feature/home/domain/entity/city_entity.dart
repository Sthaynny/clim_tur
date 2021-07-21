class CityEntity {
  CityEntity({
    required this.id,
    required this.name,
    required this.country,
    required this.timezone,
  });
  int id;
  String name;
  String country;
  int timezone;

  CityEntity copyWith({
    int? id,
    String? name,
    String? country,
    int? timezone,
  }) {
    return CityEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      country: country ?? this.country,
      timezone: timezone ?? this.timezone,
    );
  }
}
