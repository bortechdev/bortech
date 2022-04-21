import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'theme_constants.dart';

extension ThemeContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  EdgeInsets get headerPadding => getValueForScreenType(
        context: this,
        mobile: ThemeConstants.headerPaddingMobile,
        desktop: ThemeConstants.headerPaddingDesktop,
      );
}
