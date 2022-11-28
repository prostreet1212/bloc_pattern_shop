import '../model/coffee_menu.dart';

abstract class Action {}
abstract class MenuAction extends Action {}
abstract class BadgeAction extends Action{}

class LoadMenuAction extends MenuAction{}

class BuyNot extends MenuAction {
  final CoffeeMenu coffeeMenu;
  BuyNot(this.coffeeMenu);
}

class LoadBadgeAction extends BadgeAction{}

class ChangeBadgeCountAction extends BadgeAction{
  final CoffeeMenu coffeeMenu;
  ChangeBadgeCountAction(this.coffeeMenu);
}