import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthRepository {
  Future<Map<String, dynamic>?> getLoginData();
  Future<void> saveLoginToken(String data);
  Future<String?> getLoginToken();
  Future<void> saveLoginData(Map<String, dynamic> data);
  Future<void> saveSelectedBranch(Map<String, dynamic> data);
  Future<Map<String, dynamic>?> getSelectedBranch();
  Future<void> deleteSelectedBranch();
  Future<void> deleteLoginData();
}

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<void> saveLoginToken(String data) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final response = await sp.setString('token', jsonEncode(data));
    if (response) {
      log(jsonEncode(data), name: 'SaveLoginToken');
    } else {
      log('save login token failed', name: 'SaveLoginToken');
    }
  }

  @override
  Future<String?> getLoginToken() async {
    String? data;
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final response = sp.getString('token');
    if (response != null) {
      data = jsonDecode(response);
      log(jsonEncode(data), name: 'GetLoginToken');
    }
    return data;
  }

  @override
  Future<void> saveLoginData(Map<String, dynamic> data) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final response = await sp.setString('userData', jsonEncode(data));
    if (response) {
      log(jsonEncode(data), name: 'SaveLoginData');
    } else {
      log('save login data failed', name: 'SaveLoginData');
    }
  }

  @override
  Future<Map<String, dynamic>?> getLoginData() async {
    Map<String, dynamic>? data;
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final response = sp.getString('userData');
    if (response != null) {
      data = jsonDecode(response.toString());
      log(jsonEncode(data), name: 'GetLoginData');
    }
    return data;
  }

  @override
  Future<void> saveSelectedBranch(Map<String, dynamic> data) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final response = await sp.setString('branch', jsonEncode(data));
    if (response) {
      log(jsonEncode(data), name: 'SaveBranch');
    } else {
      log('save branch failed', name: 'SaveBranch');
    }
  }

  @override
  Future<Map<String, dynamic>?> getSelectedBranch() async {
    Map<String, dynamic>? data;
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final response = sp.getString('branch');
    if (response != null) {
      data = jsonDecode(response.toString());
      log(jsonEncode(data), name: 'GetBranch');
    }
    return data;
  }

  @override
  Future<void> deleteSelectedBranch() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final response = await sp.remove('branch');
    if (response) {
      log('branch deleted');
    } else {
      log('branch delete failed');
    }
  }

  @override
  Future<void> deleteLoginData() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();

    final response = await sp.remove('userData');
    final token = await sp.remove('token');
    if (response && token) {
      log('userData deleted');
    } else {
      log('userData delete failed');
    }
  }
}
