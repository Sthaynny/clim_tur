import 'package:clim_tur/core/network/dio/response/network_response.dart';
import 'package:clim_tur/core/network/end_point.dart';
import 'package:dio/dio.dart';

abstract class RequestHelper {
  Future<NetworkResponse> makeRequestHelper({
    required EndPoint endpoint,
    required Dio httpProvider,
  });
}
