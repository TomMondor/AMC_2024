import 'package:dio/dio.dart';

abstract class HttpClient {
  Future<Response> get(
    String route,
    String accessToken, {
    Map<String, dynamic>? queryParameters,
  });
  Future<Response> post(
    String route,
    String accessToken, {
    required Map<String, dynamic> data,
  });
  Future<Response> put(
    String route,
    String accessToken, {
    required Map<String, dynamic> data,
  });
  Future<Response> delete(
    String route,
    String accessToken, {
    required Map<String, dynamic> data,
  });
}
