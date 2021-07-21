class QueryFormatter {
  static String formatQueryParameters({
    required Map<String, dynamic> parameters,
  }) {
    String queryParameters = '?';
    parameters.forEach((String key, dynamic value) =>
        queryParameters = '$queryParameters$key=$value&');

    return queryParameters.substring(0, queryParameters.length - 1);
  }
}
