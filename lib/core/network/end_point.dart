import 'package:clim_tur/core/network/request/irequest_method.dart';

class EndPoint {
  EndPoint({
    required this.path,
    required this.method,
    this.queryParameters,
    this.timeout,
  });

  final String path;
  final HttpMethod method;
  final Map<String, dynamic>? queryParameters;
  final int? timeout;

  Map<String, String>? parseQueryParameters() {
    Map<String, String>? _queryParameters;
    if (queryParameters != null) {
      _queryParameters = queryParameters!.map((key, dynamic value) {
        if (value is List) {
          return MapEntry<String, String>(key, value.join(','));
        } else {
          return MapEntry<String, String>(key, '$value');
        }
      });
    }
    return _queryParameters;
  }
}
