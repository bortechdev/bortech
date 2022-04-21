import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../pages/contact_page.dart';
import '../pages/home_page.dart';
import '../pages/products_page.dart';
import '../state/tabs_cubit.dart';
import 'footer.dart';
import 'header.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TabsCubit>(
      create: (context) => TabsCubit(),
      child: Scaffold(
        body: Scrollbar(
          isAlwaysShown: getValueForScreenType<bool>(
            context: context,
            mobile: false,
            desktop: true,
          ),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BlocBuilder<TabsCubit, TabsState>(
                      buildWhen: (p, c) => p.currentTab != c.currentTab,
                      builder: (context, state) {
                        switch (state.currentTab) {
                          case AppTab.home:
                            return const HomePage();
                          case AppTab.products:
                            return const ProductsPage();
                          case AppTab.contact:
                            return const ContactPage();
                        }
                      },
                    ),
                    const Footer(),
                  ],
                ),
              ),
              Builder(builder: (context) {
                return GestureDetector(
                  onTap: () => context.read<TabsCubit>().closeMenu(),
                  child: Container(
                    color: Colors.transparent,
                  ),
                );
              }),
              const Header(),
            ],
          ),
        ),
      ),
    );
  }
}
