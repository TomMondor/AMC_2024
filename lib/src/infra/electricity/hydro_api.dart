import 'package:dio/dio.dart';

import '../../exceptions/exceptions.dart';

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

class HttpClientImpl extends HttpClient {
  final Dio _dio;

  final _baseUrl = 'http://localhost:3000/api/v1';

  HttpClientImpl(this._dio) {
    _dio.options.responseType = ResponseType.json;
  }

  @override
  Future<Response> get(
      String route,
      String accessToken, {
        Map<String, dynamic>? queryParameters,
      }) async {
    Response? response;

    try {
      _dio.options.headers['Authorization'] = 'Bearer $accessToken';
      response = await _dio.get(
        '$_baseUrl$route',
        queryParameters: queryParameters,
      );
    } on DioException catch (e) {
      if (e.response != null) {
        throw ApiException(
          errorCode: e.response?.statusCode,
          data: e.response?.data,
        );
      } else {
        // Error due to setting up or sending the request
        throw ApiException(data: e.message);
      }
    } catch (e) {
      throw const ApiException(data: 'Something went wrong.');
    }

    return response;
  }

  @override
  Future<Response> post(
      String route,
      String accessToken, {
        required Map<String, dynamic> data,
      }) async {
    Response? response;

    try {
      _dio.options.headers['Authorization'] = 'Bearer $accessToken';
      response = await _dio.post('$_baseUrl$route', data: data);
    } on DioException catch (e) {
      if (e.response != null) {
        throw ApiException(
          errorCode: e.response?.statusCode,
          data: e.response?.data,
        );
      } else {
        // Error due to setting up or sending the request
        throw ApiException(data: e.message);
      }
    } catch (e) {
      throw const ApiException(data: 'Something went wrong.');
    }

    return response;
  }

  @override
  Future<Response> put(
      String route,
      String accessToken, {
        required Map<String, dynamic> data,
      }) async {
    Response? response;
    try {
      _dio.options.headers['Authorization'] = 'Bearer $accessToken';
      response = await _dio.put('$_baseUrl$route', data: data);
    } on DioException catch (e) {
      if (e.response != null) {
        throw ApiException(
          errorCode: e.response?.statusCode,
          data: e.response?.data,
        );
      } else {
        // Error due to setting up or sending the request
        throw ApiException(data: e.message);
      }
    } catch (e) {
      throw const ApiException(data: 'Something went wrong.');
    }

    return response;
  }

  @override
  Future<Response> delete(
      String route,
      String accessToken, {
        required Map<String, dynamic> data,
      }) async {
    Response? response;
    try {
      _dio.options.headers['Authorization'] = 'Bearer $accessToken';
      response = await _dio.delete('$_baseUrl$route', data: data);
    } on DioException catch (e) {
      if (e.response != null) {
        throw ApiException(
          errorCode: e.response?.statusCode,
          data: e.response?.data,
        );
      } else {
        // Error due to setting up or sending the request
        throw ApiException(data: e.message);
      }
    } catch (e) {
      throw const ApiException(data: 'Something went wrong.');
    }

    return response;
  }
}