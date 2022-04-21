import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../localization/localization.dart';

part 'tabs_state.dart';

class TabsCubit extends Cubit<TabsState> {
  TabsCubit() : super(const TabsState());

  void changeCurrentTab(AppTab value) {
    emit(state.copyWith(currentTab: value));
  }

  void switchIsMenuOpened() {
    emit(state.copyWith(isMenuOpened: !state.isMenuOpened));
  }

  void closeMenu() {
    if (state.isMenuOpened) emit(state.copyWith(isMenuOpened: false));
  }
}
