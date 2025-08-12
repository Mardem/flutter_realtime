import 'package:dio/dio.dart';

import '../domain/http_client_interface.dart';
import '../domain/http_response_interface.dart';

class HttpClientImpl implements HttpClient {
  final Dio _client;

  final String? baseUrl;

  HttpClientImpl({
    this.baseUrl,
  }) : _client = Dio(
         BaseOptions(
           baseUrl: baseUrl ?? '',
         ),
       );

  @override
  Future<HttpResponse<dynamic>> get(
    String path, {
    String? baseUrl,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    final request = await _client.get(
      path,
      queryParameters: queryParameters,
      options: options,
    );

    final response = HttpResponse();
    response.data = request.data;

    return response;
  }

  @override
  Future<HttpResponse<dynamic>> post(
    String path, {
    String? baseUrl,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    final request = await _client.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );

    final response = HttpResponse();
    response.data = request.data;

    return response;
  }

  @override
  Future<HttpResponse<dynamic>> put(
    String path, {
    String? baseUrl,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    final request = await _client.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );

    final response = HttpResponse();
    response.data = request.data;

    return response;
  }

  @override
  Future<HttpResponse<dynamic>> delete(
    String path, {
    String? baseUrl,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    final request = await _client.delete(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );

    final response = HttpResponse();
    response.data = request.data;

    return response;
  }
}
