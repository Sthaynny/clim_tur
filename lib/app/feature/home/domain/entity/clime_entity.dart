import 'package:clim_tur/app/feature/home/data/models/weathe_forecast_model.dart';
import 'package:clim_tur/app/feature/home/data/models/weather_model.dart';

class ClimeEntity {
  ClimeEntity({
    required this.id,
    required this.name,
    required this.cod,
    required this.weather,
    required this.weatherForecast,
  });
  final int id;
  final String name;
  final int cod;
  final List<WeatherModel> weather;
  final WeatherForecastModel weatherForecast;

  ClimeEntity copyWith({
    int? id,
    String? name,
    int? cod,
    List<WeatherModel>? weather,
    WeatherForecastModel? weatherForecast,
  }) {
    return ClimeEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      cod: cod ?? this.cod,
      weather: weather ?? this.weather,
      weatherForecast: weatherForecast ?? this.weatherForecast,
    );
  }
}
