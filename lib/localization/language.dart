import 'package:flutter/cupertino.dart';

import 'localization_constants.dart';

enum Language { en, tr, ru }

extension LanguageExtension on Language {
  bool get isEn => this == Language.en;

  bool get isTr => this == Language.tr;

  bool get isRu => this == Language.ru;

  Locale get toLocale {
    switch (this) {
      case Language.en:
        return LocalizationConstants.enLocale;
      case Language.tr:
        return LocalizationConstants.trLocale;
      case Language.ru:
        return LocalizationConstants.ruLocale;
    }
  }

  String get toTitle {
    switch (this) {
      case Language.en:
        return 'English';
      case Language.tr:
        return 'Turkish';
      case Language.ru:
        return 'Russian';
    }
  }
}
