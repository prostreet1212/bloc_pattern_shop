import '../model/coffee_menu.dart';

class AppState{
  List<CoffeeMenu> menuList;
List<CoffeeMenu> badgeList;

  AppState( this.menuList, this.badgeList);

  AppState copyWith({required List<CoffeeMenu>? menuList,required List<CoffeeMenu>? badgeList}) {
    return AppState(

      menuList  ?? this.menuList, badgeList ?? this.badgeList,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AppState &&
              runtimeType == other.runtimeType &&
              menuList == other.menuList &&
              badgeList == other.badgeList;

  @override
  int get hashCode => menuList.hashCode ^ badgeList.hashCode;

  @override
  String toString() => 'SpeakersState{speakers: $menuList, filter: $badgeList}';
}