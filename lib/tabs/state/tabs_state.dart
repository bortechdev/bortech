part of 'tabs_cubit.dart';

enum AppTab { home, products, contact }

extension AppTabExtension on AppTab {
  bool get isHome => this == AppTab.home;

  bool get isProducts => this == AppTab.products;

  bool get isContact => this == AppTab.contact;

  String get toTitle {
    switch (this) {
      case AppTab.home:
        return LocaleKeys.tabs_title_1.locale;
      case AppTab.products:
        return LocaleKeys.tabs_title_2.locale;
      case AppTab.contact:
        return LocaleKeys.tabs_title_3.locale;
    }
  }
}

class TabsState extends Equatable {
  final AppTab currentTab;
  final bool isMenuOpened;

  const TabsState({
    this.currentTab = AppTab.home,
    this.isMenuOpened = false,
  });

  @override
  List<Object> get props => [currentTab, isMenuOpened];

  TabsState copyWith({
    AppTab? currentTab,
    bool? isMenuOpened,
  }) =>
      TabsState(
        currentTab: currentTab ?? this.currentTab,
        isMenuOpened: isMenuOpened ?? this.isMenuOpened,
      );
}
