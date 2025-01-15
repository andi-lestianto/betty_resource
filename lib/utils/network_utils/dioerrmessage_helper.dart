import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DioErrorMessageHelper {
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
          // if (exception.response!.statusCode == 401) {
          //   if (!gx.Get.currentRoute.contains(Routes.GENERAL_LOGIN)) {
          //     Toast().showAlert(message: 'apierror_unAuthorized'.tr);
          //     authCtrl.deleteCurrentUser();
          //     gx.Get.offAllNamed(Routes.GENERAL_LOGIN);
          //   }
          // }
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
