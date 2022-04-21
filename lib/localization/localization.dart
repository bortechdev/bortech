export 'language.dart';
export 'locale_keys.g.dart';
export 'localization_constants.dart';
export 'localization_extensions.dart';

//flutter pub run easy_localization:generate -O lib/localization -f keys -o locale_keys.g.dart -S assets/lang

/*
Example:
{
  ...
  "msg":"{} are written in the {} language",
  ...
}
Text('msg').tr(args: ['Easy localization', 'Dart']),

Example:
{
  ...
  "example": {
    "fullName": "Full Name",
    "emptyNameError": "Please fill in your @.lower:example.fullName"
  }
  ...
}
print('example.emptyNameError'.tr()); //Output: Please fill in your full name
 */
