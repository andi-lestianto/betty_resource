import 'dart:developer';

import 'package:betty_resource/data/model/branchresponse_model.dart';
import 'package:betty_resource/data/model/userresponse_model.dart';
import 'package:betty_resource/data/repository/auth_repository.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthRepository authRepository;

  AuthController({required this.authRepository});

  UsersResponse? usersResponse;

  String? currentToken;

  Branches? selectedBranch;

  setUserToken(String token) {
    authRepository.saveLoginToken(token);
  }

  setCurrentUser(UsersResponse data) {
    usersResponse = data;
    authRepository.saveLoginData(data.toJson());
  }

  setSelectedBranch(Branches data) {
    selectedBranch = data;
    authRepository.saveSelectedBranch(data.toJson());
  }

  getCurrentUser() async {
    final userData = await authRepository.getLoginData();

    if (userData != null) {
      usersResponse = UsersResponse.fromJson(userData);
      log(usersResponse!.data!.toJson().toString(), name: 'GetCurrentUser');
    }
  }

  getCurrentToken() async {
    final data = await authRepository.getLoginToken();
    if (data != null) {
      currentToken = data;
      log(currentToken.toString(), name: 'GetCurrentToken');
    }
  }

  getSelectedBranch() async {
    final data = await authRepository.getSelectedBranch();
    if (data != null) {
      selectedBranch = Branches.fromJson(data);
      log(selectedBranch!.toJson().toString(), name: 'GetSelectedBranch');
    }
  }

  deleteCurrentUser() async {
    usersResponse = null;
    authRepository.deleteLoginData();
    await Future.delayed(const Duration(seconds: 1)).then((value) {
      Get.offAllNamed('/login');
    });
  }

  logout() {
    deleteCurrentUser();
  }

  logoutBranch() async {
    selectedBranch = null;
    authRepository.deleteSelectedBranch();
    await Future.delayed(const Duration(seconds: 1)).then((value) {
      Get.offAllNamed('/select-profile');
    });
  }

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
    getCurrentToken();
    getSelectedBranch();
  }
}
