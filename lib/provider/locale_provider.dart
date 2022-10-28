import 'package:flutter/material.dart';
import 'package:flutter_localization/l10n/l10n.dart';

import '../shared_preference.dart';

class LocaleProvider extends ChangeNotifier {

  LocaleProvider() {
    initLocale();
  }

  initLocale() async {
    String appLocale = await AppSharedPreferences().getLocale();
    Locale conLocale = Locale(appLocale);
    _locale = conLocale;
    notifyListeners();
  }
  Locale? _locale;

  Locale? get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }

  void clearLocale(){
    _locale = null;
    notifyListeners();
  }
}

