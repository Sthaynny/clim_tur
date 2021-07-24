import 'package:clim_tur/core/network/api_manager.dart';
import 'package:clim_tur/core/network/dio/response/api_result.dart';
import 'package:clim_tur/core/network/end_point.dart';
import 'package:clim_tur/core/network/request/methods/get.dart';

class ClimeDatasource {
  Future<ApiResult> getClime(String search) async {
    final endpoint = EndPoint(
      method: Get(),
      path: 'http://api.openweathermap.org/data/2.5/weather',
      queryParameters: {
        'q': search,
        'lang': 'pt',
        'units': 'metric',
        'appid': 'b3ba611d9f1ab68d759c9af929c99bac'
      },
    );
    return ApiManager.request(endpoint: endpoint);
  }
}
