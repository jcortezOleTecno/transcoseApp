import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesLocal {

  static late SharedPreferences prefs;

  static Future<void> configurePrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  static String get transcoseUrlDynamic => prefs.getString("transcoseUrlDynamic") ?? '';
  static set transcoseUrlDynamic(String value) => prefs.setString("transcoseUrlDynamic", value);

  static String get transcoseDataFooter => prefs.getString("transcoseDataFooter") ?? '';
  static set transcoseDataFooter(String value) => prefs.setString("transcoseDataFooter", value);

  static String get veraneDAuthUser => prefs.getString("@auth_user") ?? '';
  static set veraneDAuthUser(String value) => prefs.setString("@auth_user", value);

  static bool get transcoseDeleteUser => prefs.getBool("transcoseDeleteUser") ?? false;
  static set transcoseDeleteUser(bool value) => prefs.setBool("transcoseDeleteUser", value);

  static bool get transcoseAppDevoluciones => prefs.getBool("transcoseAppDevoluciones") ?? false;
  static set transcoseAppDevoluciones(bool value) => prefs.setBool("transcoseAppDevoluciones", value);
  
  static bool get transcoseAppSat => prefs.getBool("transcoseAppSat") ?? false;
  static set transcoseAppSat(bool value) => prefs.setBool("transcoseAppSat", value);

  static bool get transcoseAppDevolucionesPermission => prefs.getBool("transcoseAppDevolucionesPermission") ?? false;
  static set transcoseAppDevolucionesPermission(bool value) => prefs.setBool("transcoseAppDevolucionesPermission", value);

  static bool get veraneValidatedDevolucion => prefs.getBool("veraneValidatedDevolucion") ?? false;
  static set veraneValidatedDevolucion(bool value) => prefs.setBool("veraneValidatedDevolucion", value);

  static bool get veraneValidatedPedidos => prefs.getBool("veraneValidatedPedidos") ?? false;
  static set veraneValidatedPedidos(bool value) => prefs.setBool("veraneValidatedPedidos", value);

  static bool get veraneValidatedGarantia => prefs.getBool("veraneValidatedGarantia") ?? false;
  static set veraneValidatedGarantia(bool value) => prefs.setBool("veraneValidatedGarantia", value);

  static bool get veraneValidatedAbonos => prefs.getBool("veraneValidatedAbonos") ?? false;
  static set veraneValidatedAbonos(bool value) => prefs.setBool("veraneValidatedAbonos", value);

}
