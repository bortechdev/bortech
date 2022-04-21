import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app.dart';
import 'localization/localization_constants.dart';
import 'theme/responsive_constants.dart';
import 'utils/simple_bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  setPathUrlStrategy();
  final storage = await HydratedStorage.build(
    storageDirectory: HydratedStorage.webStorageDirectory,
  );
  ResponsiveSizingConfig.instance.setCustomBreakpoints(const ScreenBreakpoints(
    desktop: ResponsiveConstants.desktopBreakpoint,
    tablet: ResponsiveConstants.tabletBreakpoint,
    watch: ResponsiveConstants.watchBreakpoint,
  ));
  BlocOverrides.runZoned(
    () {
      HydratedBlocOverrides.runZoned(
        () => runApp(
          EasyLocalization(
            supportedLocales: LocalizationConstants.supportedLocales,
            path: LocalizationConstants.path,
            fallbackLocale: LocalizationConstants.fallbackLocale,
            child: const App(),
          ),
        ),
        storage: storage,
      );
    },
    blocObserver: SimpleBlocObserver(),
  );
}
