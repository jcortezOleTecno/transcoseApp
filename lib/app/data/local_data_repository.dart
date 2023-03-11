import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:vemare/app/domain/model/user_data.dart';

class LocalDataRepository {
  static final LocalDataRepository _instance = LocalDataRepository._();
  factory LocalDataRepository() {
    return _instance;
  }
  LocalDataRepository._();

  late SharedPreferences _localStorage;

  initPrefs() async {
    _localStorage = await SharedPreferences.getInstance();
  }

  int? get userId {
    return _localStorage.getInt('@userId');
  }

  set userId(int? id) {
    _localStorage.setInt('@userId', id!);
  }

  String? get authToken {
    return _localStorage.getString('@auth_token');
  }

  void set authToken(String? token) {
    _localStorage.setString('@auth_token', token!);
  }

  Future<void> deleteAuthToken() async {
    await _localStorage.remove('@auth_token');
  }

  set loginDataEmail(String? email) {
    _localStorage.setString('@login_email', email!);
  }

  Future<void> deleteLoginDataEmail() async {
    await _localStorage.remove('@login_email');
  }

  String? get loginDataEmail {
    return _localStorage.getString('@login_email');
  }

  void set loginDataPassword(String? password) {
    _localStorage.setString('@login_password', password!);
  }

  Future<void> deleteLoginDataPassword() async {
    await _localStorage.remove('@login_password');
  }

  String? get loginDataPassword {
    return _localStorage.getString('@login_password');
  }

  UserData? get user {
    final data = _localStorage.getString('@auth_user');
    if (data != null) {
      return UserData.froJson(jsonDecode(data));
    }
    return null;
  }

  void set user(UserData? userData) {
    _localStorage.setString('@auth_user', jsonEncode(userData!.toJson()));
  }

  Future<void> deleteUser() async {
    await _localStorage.remove('@auth_user');
  }
}
