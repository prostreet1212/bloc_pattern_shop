import 'package:bloc_pattern_shop/repository/menu_repository.dart';

import '../model/coffee_menu.dart';

class MenuState {
  final List<CoffeeMenu> listMenu;

  const MenuState({this.listMenu = const []});

  MenuState copyWith({List<CoffeeMenu>? listMenu}) {
    return MenuState(
      listMenu: listMenu ?? this.listMenu,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MenuState &&
          runtimeType == other.runtimeType &&
          listMenu == other.listMenu;

  @override
  int get hashCode => listMenu.hashCode;

  @override
  String toString() => 'MenusState{listMenu: $listMenu}';
}
