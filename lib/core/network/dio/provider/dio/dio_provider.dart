import 'package:clim_tur/core/network/dio/dio.dart';
import 'package:clim_tur/core/network/dio/provider/dio/helpers/get_helper.dart';
import 'package:clim_tur/core/network/dio/provider/dio/helpers/request_helper.dart';
import 'package:clim_tur/core/network/dio/provider/network_provider.dart';
import 'package:clim_tur/core/network/dio/response/network_response.dart';
import 'package:clim_tur/core/network/end_point.dart';
import 'package:dio/dio.dart';

class DioProvider implements NetworkProvider {
  Dio? _provider;

  Future<NetworkResponse> _safeRequest({
    required RequestHelper requestHelper,
    required EndPoint endpoint,
  }) async {
    _provider ??= await DioCreator.create(
      timeout: endpoint.timeout,
    );

    try {
      return await requestHelper.makeRequestHelper(
        endpoint: endpoint,
        httpProvider: _provider!,
      );
    } on DioError catch (e) {
      if (e.response != null) {
        return NetworkResponse(
          data: e.response!.data,
          status: e.response!.statusCode,
        );
      } else {
        return NetworkResponse(
          message: e.message,
          status: 520,
          data: null,
        );
      }
    }
  }

  @override
  Future<NetworkResponse> get({required EndPoint endpoint}) {
    final GetHelper requestHelper = GetHelper();
    return _safeRequest(requestHelper: requestHelper, endpoint: endpoint);
  }
}
