

import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  static const String APP_LOCALE = "app_localization";

  Future setLocale(String languageCode) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setString(APP_LOCALE, languageCode);
    return languageCode;
  }

  Future getLocale() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String languageCode = _prefs.getString(APP_LOCALE) ?? 'en';
    return languageCode;
  }
}