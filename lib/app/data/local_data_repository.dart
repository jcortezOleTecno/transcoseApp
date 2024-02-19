import 'dart:async';
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
    return _localStorage.getInt('@transcoseuserId');
  }

  set userId(int? id) {
    _localStorage.setInt('@transcoseuserId', id!);
  }

  String? get authToken {
    return _localStorage.getString('@transcoseauth_token');
  }

  set authToken(String? token) {
    _localStorage.setString('@transcoseauth_token', token!);
  }

  Future<void> deleteAuthToken() async {
    await _localStorage.remove('@transcoseauth_token');
  }

  set loginDataEmail(String? email) {
    _localStorage.setString('@transcoselogin_email', email!);
  }

  Future<void> deleteLoginDataEmail() async {
    await _localStorage.remove('@transcoselogin_email');
  }

  String? get loginDataEmail {
    return _localStorage.getString('@transcoselogin_email');
  }

  set loginDataPassword(String? password) {
    _localStorage.setString('@transcoselogin_password', password!);
  }

  Future<void> deleteLoginDataPassword() async {
    await _localStorage.remove('@transcoselogin_password');
  }

  String? get loginDataPassword {
    return _localStorage.getString('@transcoselogin_password');
  }

  UserData? get user {
    final data = _localStorage.getString('@transcoseauth_user');
    if (data != null) {
      return UserData.fromJson(jsonDecode(data));
    }
    return null;
  }

  set user(UserData? userData) {
    _localStorage.setString('@transcoseauth_user', jsonEncode(userData!.toJson()));
  }

  Future<void> deleteUser() async {
    await _localStorage.remove('@transcoseauth_user');
  }

  bool get isLogged => _localStorage.getBool('@transcoseisLogged') ?? false;

  set isLogged(bool value) {
    _localStorage.setBool('@transcoseisLogged', value);
  }

  Future<void> logOut() async {
    _localStorage
      ..setBool('@transcoseisLogged', false)
      ..remove('@transcoseauth_user')
      ..remove('@transcoseauth_token');
  }
}
