import 'package:clim_tur/core/network/dio/response/network_response.dart';
import 'package:clim_tur/core/network/end_point.dart';

abstract class NetworkProvider {
  Future<NetworkResponse> get({required EndPoint endpoint});
}
