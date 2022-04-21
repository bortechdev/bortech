import 'package:responsive_builder/responsive_builder.dart';

enum DeviceType { mobile, tablet, desktop }

extension DeviceTypeExtension on DeviceType {
  bool get isMobile => this == DeviceType.mobile;

  bool get isTablet => this == DeviceType.tablet;

  bool get isDesktop => this == DeviceType.desktop;
}

extension DeviceScreenTypeExtension on DeviceScreenType {
  DeviceType get toDeviceType {
    switch (this) {
      case DeviceScreenType.Mobile:
      case DeviceScreenType.mobile:
      case DeviceScreenType.Watch:
      case DeviceScreenType.watch:
        return DeviceType.mobile;
      case DeviceScreenType.Tablet:
      case DeviceScreenType.tablet:
        return DeviceType.tablet;
      case DeviceScreenType.Desktop:
      case DeviceScreenType.desktop:
        return DeviceType.desktop;
    }
  }
}
