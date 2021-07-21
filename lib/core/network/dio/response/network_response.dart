import 'package:clim_tur/core/network/dio/response/api_result.dart';

class NetworkResponse implements ApiResult {
  NetworkResponse({
    required this.data,
    this.status,
    this.message,
  });

  final dynamic data;
  final int? status;
  final String? message;
}
