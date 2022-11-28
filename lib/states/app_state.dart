import 'package:bloc_pattern_shop/repository/menu_repository.dart';
import 'package:bloc_pattern_shop/states/badge_state.dart';
import 'package:bloc_pattern_shop/states/menu_state.dart';

import '../model/coffee_menu.dart';

class AppState {
  final MenuState menuState;
  final BadgeState badgeState;

  const AppState(
      {this.menuState = const MenuState(),
      this.badgeState = const BadgeState()});

  AppState copyWith({
    MenuState? menuState,
    BadgeState? badgeState,
  }) {
    return AppState(
      menuState: menuState ?? this.menuState,
      badgeState: badgeState ?? this.badgeState,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          menuState == other.menuState &&
          badgeState == other.badgeState;

  @override
  int get hashCode => menuState.hashCode^badgeState.hashCode;

  @override
  String toString() => 'AppState{menuState: $menuState, badgeState: $badgeState}';
}
