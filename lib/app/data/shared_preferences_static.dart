import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesLocal {

  static late SharedPreferences prefs;

  static Future<void> configurePrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  static String get veraneUrlDynamic => prefs.getString("veraneUrlDynamic") ?? '';
  static set veraneUrlDynamic(String value) => prefs.setString("veraneUrlDynamic", value);

  static String get veraneDataFooter => prefs.getString("veraneDataFooter") ?? '';
  static set veraneDataFooter(String value) => prefs.setString("veraneDataFooter", value);

  static bool get veraneDeleteUser => prefs.getBool("veraneDeleteUser") ?? false;
  static set veraneDeleteUser(bool value) => prefs.setBool("veraneDeleteUser", value);

  static bool get veraneAppDevoluciones => prefs.getBool("veraneAppDevoluciones") ?? false;
  static set veraneAppDevoluciones(bool value) => prefs.setBool("veraneAppDevoluciones", value);

  static bool get veraneAppDevolucionesPermission => prefs.getBool("veraneAppDevolucionesPermission") ?? false;
  static set veraneAppDevolucionesPermission(bool value) => prefs.setBool("veraneAppDevolucionesPermission", value);

}
