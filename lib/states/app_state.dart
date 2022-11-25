import '../model/coffee_menu.dart';

class AppState{
  List<CoffeeMenu> menuList;
List<CoffeeMenu> badgeList;

  AppState(this.menuList, this.badgeList);

  AppState copyWith({required List<CoffeeMenu>? menuList, required List<CoffeeMenu>? badgeList}) {
    return AppState(
      menuList:menuList ?? this.menuList,
      badgeList:badgeList ?? this.badgeList,
    );
  }
}