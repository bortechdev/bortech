import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../localization/localization.dart';
import '../../theme/button.dart';
import '../../theme/device_type.dart';
import '../../theme/theme_constants.dart';
import '../../theme/theme_extensions.dart';
import '../state/tabs_cubit.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.scaffoldBackgroundColor,
      child: Center(
        heightFactor: 1,
        child: Container(
          constraints: const BoxConstraints(maxWidth: ThemeConstants.maxWidth),
          padding: context.headerPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const _Logo(),
                  const Spacer(),
                  ResponsiveBuilder(
                    builder: (context, info) {
                      switch (info.deviceScreenType.toDeviceType) {
                        case DeviceType.mobile:
                        case DeviceType.tablet:
                          return const _MenuButton();
                        case DeviceType.desktop:
                          return _TabRow();
                      }
                    },
                  ),
                ],
              ),
              ResponsiveBuilder(
                builder: (context, info) {
                  switch (info.deviceScreenType.toDeviceType) {
                    case DeviceType.mobile:
                    case DeviceType.tablet:
                      return _Menu();
                    case DeviceType.desktop:
                      return const SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({Key? key}) : super(key: key);

  static TextStyle? textStyle1(BuildContext context) => context.theme.textTheme.headlineSmall?.copyWith(
        fontWeight: FontWeight.w900,
      );

  static TextStyle? textStyle2(BuildContext context) => context.theme.textTheme.headlineSmall?.copyWith(
        color: const Color.fromRGBO(216, 169, 89, 1),
        fontWeight: FontWeight.w900,
      );

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => context.read<TabsCubit>().changeCurrentTab(AppTab.home),
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'BOR',
                style: textStyle1(context),
              ),
              TextSpan(
                text: 'TECH',
                style: textStyle2(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuButton extends StatefulWidget {
  const _MenuButton({Key? key}) : super(key: key);

  @override
  State<_MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<_MenuButton> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: ThemeConstants.menuDuration,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => context.read<TabsCubit>().switchIsMenuOpened(),
        child: BlocListener<TabsCubit, TabsState>(
          listener: (context, state) {
            state.isMenuOpened ? _animationController.forward() : _animationController.reverse();
          },
          child: AnimatedIcon(
            progress: CurvedAnimation(
              curve: Curves.linear,
              parent: _animationController,
            ),
            icon: AnimatedIcons.menu_close,
            size: ThemeConstants.iconSize,
          ),
        ),
      ),
    );
  }
}

class _Menu extends StatelessWidget {
  const _Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabsCubit, TabsState>(
      buildWhen: (p, c) => p.isMenuOpened != c.isMenuOpened,
      builder: (context, state) {
        return AnimatedSize(
          duration: ThemeConstants.menuDuration,
          curve: Curves.fastOutSlowIn,
          child: state.isMenuOpened
              ? Column(
                children: AppTab.values
                    .map<Widget>(
                      (e) => _MenuItem(tab: e),
                    )
                    .toList()
                  ..insert(
                    AppTab.values.length - 1,
                    const _LanguageButton(isFromMenu: true),
                  ),
              )
              : const SizedBox.shrink(),
        );
      },
    );
  }
}

class _MenuItem extends StatelessWidget {
  final AppTab tab;

  const _MenuItem({
    Key? key,
    required this.tab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabsCubit, TabsState>(
      buildWhen: (p, c) => p.currentTab != c.currentTab,
      builder: (context, state) {
        return Padding(
          padding: ThemeConstants.menuItemPadding,
          child: BtButton(
            onPressed: () {
              context.read<TabsCubit>().changeCurrentTab(tab);
              context.read<TabsCubit>().switchIsMenuOpened();
            },
            isFilled: tab == AppTab.contact,
            isSelected: tab == state.currentTab,
            child: Text(tab.toTitle),
          ),
        );
      },
    );
  }
}

class _TabRow extends StatelessWidget {
  const _TabRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: AppTab.values
          .map<Widget>(
            (e) => _TabRowItem(tab: e),
          )
          .toList()
        ..insert(
          AppTab.values.length - 1,
          const _LanguageButton(isFromMenu: false),
        ),
    );
  }
}

class _TabRowItem extends StatelessWidget {
  final AppTab tab;

  const _TabRowItem({
    Key? key,
    required this.tab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabsCubit, TabsState>(
      buildWhen: (p, c) => p.currentTab != c.currentTab,
      builder: (context, state) {
        return Padding(
          padding: ThemeConstants.tabRowItemPadding,
          child: BtButton(
            onPressed: () => context.read<TabsCubit>().changeCurrentTab(tab),
            isFilled: tab == AppTab.contact,
            isSelected: tab == state.currentTab,
            child: Text(tab.toTitle),
          ),
        );
      },
    );
  }
}

class _LanguageButton extends StatelessWidget {
  final bool isFromMenu;

  const _LanguageButton({
    Key? key,
    required this.isFromMenu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isFromMenu ? ThemeConstants.menuItemPadding : ThemeConstants.tabRowItemPadding,
      child: DropdownButtonHideUnderline(
        child: DropdownButton<Locale>(
          focusColor: Colors.transparent,
          style: context.theme.textTheme.titleMedium,
          value: context.locale,
          isDense: true,
          items: Language.values
              .map(
                (e) => DropdownMenuItem<Locale>(
                  value: e.toLocale,
                  child: Text(
                    e.toTitle,
                    style: context.theme.textTheme.titleMedium,
                  ),
                ),
              )
              .toList(),
          onChanged: (locale) => context.setLocale(locale!),
        ),
      ),
    );
  }
}
