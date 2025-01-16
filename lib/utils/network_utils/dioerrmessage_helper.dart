import 'dart:developer';

import 'package:betty_resource/core/controller/auth_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DioErrorMessageHelper {
  final AuthController authController = Get.find();
  SnackbarController? controller;
  Future<String> getErrorMessage(DioException exception) async {
    log(exception.type.toString(), name: 'apiResponseError');

    switch (exception.type) {
      case DioExceptionType.connectionError:
        // if (appsettingController.connectionStatus ==
        //     InternetConnectionStatus.connected) {
        //   return ApiResponse.error('apierror_default'.tr);
        // }
        return 'apierror_connectionError'.tr;
      case DioExceptionType.cancel:
        return 'apierror_cancel'.tr;
      case DioExceptionType.connectionTimeout:
        return 'apierror_connectionTimeout'.tr;
      case DioExceptionType.sendTimeout:
        return 'apierror_sendTimeout'.tr;
      case DioExceptionType.receiveTimeout:
        return 'apierror_receiveTimeout'.tr;
      case DioExceptionType.badResponse:
        if (exception.response != null) {
          if (exception.response!.statusCode == 401) {
            if (!Get.currentRoute.contains('/login')) {
              // Toast().showAlert(message: 'apierror_unAuthorized'.tr);
              authController.deleteCurrentUser();
              Get.offAllNamed('/login');
            }
          }
        }
        String errorMessage = '';
        errorMessage = (exception.response != null
            ? exception.response!.data.runtimeType == String
                ? '${exception.response!.statusCode} ${exception.response!.statusMessage}'
                : (exception.response!.data as Map<String, dynamic>)
                        .entries
                        .first
                        .value is List
                    ? (exception.response!.data as Map<String, dynamic>)
                        .entries
                        .first
                        .value
                        .first
                    : exception.response!.data['message']
            : exception.message.toString());

        return errorMessage;
      case DioExceptionType.unknown:
        return 'apierror_unknown'.tr;

      default:
        return 'apierror_default'.tr;
    }
  }
}
