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

}
