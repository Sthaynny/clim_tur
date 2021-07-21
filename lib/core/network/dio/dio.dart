import 'package:dio/dio.dart';

class DioCreator {
  static const baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  static Future<Dio> create({
    int? timeout,
  }) async {
    final Dio dioCreator = Dio()
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = timeout ?? 30
      ..options.receiveTimeout = 30;

    return dioCreator;
  }
}
