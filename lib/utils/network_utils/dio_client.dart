import 'dart:convert';
import 'dart:developer';
import 'package:betty_resource/utils/network_utils/endpoint_baseurl_const.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class DioClient {
  Future<Response<T>> fetchUsers<T>(String path);
  Future<Response<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters});
  Future<Response<T>> post<T>(String path, {Map<String, dynamic>? body});
  Future<Response<T>> postFormData<T>(String path,
      {required FormData formData});
  Future<Response<T>> put<T>(String path, {Map<String, dynamic>? body});
  Future<Response<T>> delete<T>(String path, {Map<String, dynamic>? body});
  Future<Response<T>> patch<T>(String path, {Map<String, dynamic>? body});
  Future<Response<T>> patchFormData<T>(String path,
      {required FormData formData});
}

class DioClientImpl implements DioClient {
  @override
  Future<Response<T>> fetchUsers<T>(String path) async {
    try {
      final response = await dio.get<T>(path);
      return response;
    } catch (e) {
      if (e is DioException) {
        rethrow;
      }
      throw Exception(e);
    }
  }

  Future<String?> _getCurrentToken() async {
    String? data;
    final sp = await SharedPreferences.getInstance();
    final response = sp.getString('token');
    if (response != null) {
      data = jsonDecode(response.toString());
    }

    return data;
  }

  @override
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.get<T>(
        path,
        queryParameters: queryParameters,
      );

      return response;
    } catch (e) {
      if (e is DioException) {
        rethrow;
      }
      throw Exception(e);
    }
  }

  @override
  Future<Response<T>> post<T>(String path, {Map<String, dynamic>? body}) async {
    try {
      final response = await dio.post<T>(path, data: body);
      return response;
    } catch (e) {
      if (e is DioException) {
        rethrow;
      }
      throw Exception(e);
    }
  }

  @override
  Future<Response<T>> postFormData<T>(String path,
      {required FormData formData}) async {
    try {
      final response = await dio.post<T>(
        path,
        data: formData,
      );
      return response;
    } catch (e) {
      if (e is DioException) {
        rethrow;
      }
      throw Exception(e);
    }
  }

  @override
  Future<Response<T>> put<T>(String path, {Map<String, dynamic>? body}) async {
    try {
      final response = await dio.put<T>(path, data: body);
      return response;
    } catch (e) {
      if (e is DioException) {
        rethrow;
      }
      throw Exception(e);
    }
  }

  @override
  Future<Response<T>> delete<T>(String path,
      {Map<String, dynamic>? body}) async {
    try {
      final response = await dio.delete<T>(path, data: body);
      return response;
    } catch (e) {
      if (e is DioException) {
        rethrow;
      }
      throw Exception(e);
    }
  }

  @override
  Future<Response<T>> patch<T>(String path,
      {Map<String, dynamic>? body}) async {
    try {
      final response = await dio.patch<T>(path, data: body);
      return response;
    } catch (e) {
      if (e is DioException) {
        rethrow;
      }
      throw Exception(e);
    }
  }

  @override
  Future<Response<T>> patchFormData<T>(String path,
      {required FormData formData}) async {
    try {
      final response = await dio.patch<T>(
        path,
        data: formData,
      );
      return response;
    } catch (e) {
      if (e is DioException) {
        rethrow;
      }
      throw Exception(e);
    }
  }

  late Dio dio = Dio()
    ..options.headers = {'Accept': 'application/json'}
    ..options.baseUrl = EndpointBaseUrl.apiUrl
    ..options.connectTimeout = const Duration(seconds: 15)
    ..options.receiveTimeout = const Duration(seconds: 15)
    ..options.responseType = ResponseType.json
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest:
            (RequestOptions options, RequestInterceptorHandler handler) async {
          // final token = await _getCurrentToken();
          final token = await _getCurrentToken();
          if (token != null) {
            options.headers.addAll({'Authorization': 'Bearer $token'});
          }

          if (options.data is! FormData) {
            log(
                '\x1B[35m' +
                    json.encode((options.method == 'GET')
                        ? options.queryParameters
                        : options.data) +
                    '\x1B[0m',
                name: '${options.method} : ${options.uri}');
          }

          return handler.next(options);
        },
        onResponse:
            (Response response, ResponseInterceptorHandler handler) async {
          log('\x1B[32m ' + json.encode(response.data) + '\x1B[0m',
              name:
                  '🚀 code : ${response.statusCode} - ${response.realUri.toString().replaceAll(EndpointBaseUrl.apiUrl, "")}');
          return handler.next(response);
        },
        onError: (DioException e, ErrorInterceptorHandler handler) async {
          log('\x1B[31m ' + json.encode(e.response?.data) + '\x1B[0m',
              name:
                  '🔄 code : ${e.response?.statusCode} - ${e.requestOptions.path.toString()}');
          if (e.response != null) {
            log(e.response!.statusCode.toString(), name: 'StatusCode Error');

            if (e.response!.statusCode == 401) {
              // await getNewToken();
            }
          }

          return handler.next(e);
        },
      ),
    );
}
