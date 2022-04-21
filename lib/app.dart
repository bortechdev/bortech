import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'tabs/view/tabs_page.dart';
import 'theme/theme_constants.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bortech',
      theme: ThemeConstants.theme,
      home: const TabsPage(),
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
    );
  }

}
