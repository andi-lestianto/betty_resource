import 'dart:convert';
import 'dart:developer';

import 'package:betty_resource/utils/network_utils/endpoint_baseurl_const.dart';
import 'package:dio/dio.dart';

abstract class DioClientCp {
  Future<Response<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters});
}

class DioClientCpImpl implements DioClientCp {
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

  late Dio dio = Dio()
    ..options.headers = {'Accept': 'application/json'}
    ..options.baseUrl = EndpointBaseUrl.cpApiUrl
    ..options.connectTimeout = const Duration(seconds: 15)
    ..options.receiveTimeout = const Duration(seconds: 15)
    ..options.responseType = ResponseType.json
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest:
            (RequestOptions options, RequestInterceptorHandler handler) async {
          if (options.data is! FormData) {
            log('\x1B[35m${json.encode((options.method == 'GET') ? options.queryParameters : options.data)}\x1B[0m',
                name: '${options.method} : ${options.uri}');
          }

          return handler.next(options);
        },
        onResponse:
            (Response response, ResponseInterceptorHandler handler) async {
          log('\x1B[32m ${json.encode(response.data)}\x1B[0m',
              name:
                  '🚀 code : ${response.statusCode} - ${response.realUri.toString().replaceAll(EndpointBaseUrl.apiUrl, "")}');
          return handler.next(response);
        },
        onError: (DioException e, ErrorInterceptorHandler handler) async {
          log('\x1B[31m ${json.encode(e.response?.data)}\x1B[0m',
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
