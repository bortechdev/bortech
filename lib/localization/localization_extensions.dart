import 'package:easy_localization/easy_localization.dart';

extension LocalizationStringExtension on String {
  String get locale => this.tr();
}
