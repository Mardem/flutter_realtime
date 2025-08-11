import 'package:dio/dio.dart';

import 'http_response_interface.dart';

abstract interface class HttpClient {
  Future<HttpResponse<dynamic>> get(
    String path, {
    String? baseUrl,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  Future<HttpResponse<dynamic>> post(
    String path, {
    String? baseUrl,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  Future<HttpResponse<dynamic>> put(
    String path, {
    String? baseUrl,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  Future<HttpResponse<dynamic>> delete(
    String path, {
    String? baseUrl,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });
}
