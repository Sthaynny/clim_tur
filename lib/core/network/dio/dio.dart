import 'package:dio/dio.dart';

class DioCreator {
  static const baseUrl = 'api.openweathermap.org/data/2.5/weather';

  static Future<Dio> create({
    int? timeout,
  }) async {
    final Dio dioCreator = Dio()
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = timeout ?? 10000
      ..options.receiveTimeout = 10000;

    return dioCreator;
  }
}
