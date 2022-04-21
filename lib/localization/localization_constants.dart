import 'package:flutter/widgets.dart';

class LocalizationConstants {
  static const Locale enLocale = Locale('en', 'US');
  static const Locale trLocale = Locale('tr', 'TR');
  static const Locale ruLocale = Locale('ru', 'RU');

  static const List<Locale> supportedLocales = [enLocale, trLocale, ruLocale];
  static const String path = 'assets/lang';
  static const Locale fallbackLocale = trLocale;
}