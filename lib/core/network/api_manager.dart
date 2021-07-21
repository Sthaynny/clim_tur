import 'dart:async';

import 'package:clim_tur/core/network/dio/provider/dio/dio_provider.dart';
import 'package:clim_tur/core/network/dio/provider/network_provider.dart';
import 'package:clim_tur/core/network/dio/response/api_result.dart';
import 'package:clim_tur/core/network/dio/response/network_response.dart';
import 'package:clim_tur/core/network/dio/response/states/apiError/api_error.dart';
import 'package:clim_tur/core/network/dio/response/states/success.dart';
import 'package:clim_tur/core/network/end_point.dart';

class ApiManager {
  static final NetworkProvider _networkProvider = DioProvider();

  static Future<ApiResult> request({required Endpoint endpoint}) async {
    try {
      final NetworkResponse response = await endpoint.method.request(
        http: _networkProvider,
        endpoint: endpoint,
      );

      if (response.status! >= 200 && response.status! < 400) {
        return Future<Success>.value(
          Success(data: response.data, statusCode: response.status!),
        );
      }
      return Future<ApiError>.value(
        ApiError(statusCode: response.status!),
      );
    } catch (_) {
      return Future<ApiError>.value(
        ApiError(statusCode: -1),
      );
    }
  }
}
