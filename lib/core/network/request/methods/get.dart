import 'package:clim_tur/core/network/dio/provider/network_provider.dart';
import 'package:clim_tur/core/network/dio/response/network_response.dart';
import 'package:clim_tur/core/network/end_point.dart';
import 'package:clim_tur/core/network/request/irequest_method.dart';

class Get implements HttpMethod {
  @override
  Future<NetworkResponse> request(
      {required NetworkProvider http, required EndPoint endpoint}) {
    return http.get(endpoint: endpoint);
  }
}
