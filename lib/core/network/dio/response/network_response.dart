class NetworkResponse {
  NetworkResponse({
    required this.data,
    this.status,
    this.message,
  });

  final dynamic data;
  final int? status;
  final String? message;
}
