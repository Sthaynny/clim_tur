import 'package:clim_tur/core/network/dio/provider/network_provider.dart';
import 'package:clim_tur/core/network/dio/response/network_response.dart';
import 'package:clim_tur/core/network/end_point.dart';

abstract class HttpMethod {
  Future<NetworkResponse> request({
    required NetworkProvider http,
    required Endpoint endpoint,
  });
}
