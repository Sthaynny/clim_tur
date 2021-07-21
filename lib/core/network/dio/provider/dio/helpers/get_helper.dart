import 'package:clim_tur/core/network/dio/provider/dio/helpers/request_helper.dart';
import 'package:clim_tur/core/network/dio/response/network_response.dart';
import 'package:clim_tur/core/network/end_point.dart';
import 'package:dio/dio.dart';

class GetHelper implements RequestHelper {
  Map<String, String>? mapToQueryString(EndPoint endpoint) {
    Map<String, String>? queryParameters;
    if (endpoint.queryParameters != null) {
      queryParameters = endpoint.queryParameters!.map((key, dynamic value) {
        if (value is List) {
          return MapEntry<String, String>(key, value.join(','));
        } else {
          return MapEntry<String, String>(key, '$value');
        }
      });
    }

    return queryParameters;
  }

  @override
  Future<NetworkResponse> makeRequestHelper({
    required EndPoint endpoint,
    required Dio httpProvider,
  }) async {
    final Response<dynamic> response = await httpProvider.get<dynamic>(
      endpoint.path,
      queryParameters: endpoint.parseQueryParameters(),
      options: Options(
        headers: <String, dynamic>{
          ...httpProvider.options.headers,
        },
        responseType: ResponseType.json,
      ),
    );
    return NetworkResponse(
      data: response.data,
      status: response.statusCode,
    );
  }
}
