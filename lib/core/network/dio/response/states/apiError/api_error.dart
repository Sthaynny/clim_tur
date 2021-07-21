import 'package:clim_tur/core/network/dio/response/api_result.dart';

class ApiError implements ApiResult {
  ApiError({
    required this.statusCode,
  });

  final int statusCode;
}
