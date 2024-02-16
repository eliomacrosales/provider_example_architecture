import 'models/response_api.dart';

abstract class NetworkService {
  String get baseUrl;

  Map<String, Object> get headers;

  void updateHeader(Map<String, dynamic> data);

  Future<ResponseApi> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  });

  Future<ResponseApi> post(
    String endpoint, {
    Map<String, dynamic>? data,
  });
}
