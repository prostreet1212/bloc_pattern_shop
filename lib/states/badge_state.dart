import '../model/coffee_menu.dart';

class BadgeState{
  final List<CoffeeMenu> listBadge;

  const BadgeState({this.listBadge = const[]});

  BadgeState copyWith({List<CoffeeMenu>? listBadge}) {
    return BadgeState(
      listBadge: listBadge ?? this.listBadge,
    );
  }
}