import 'package:flutter/material.dart';

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('hi'),
    const Locale('gu')
  ];
  static String getflag(String code){
    switch (code) {
      case 'hi':
        return '🇮🇳';
      case 'gu':
        return '🇮🇳';
      case 'en':
      default:
        return '🇦🇺';
    }
  }
}