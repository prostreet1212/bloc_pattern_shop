import 'dart:async';

import 'package:bloc_pattern_shop/repository/menu_repository.dart';
import 'package:bloc_pattern_shop/states/menu_state.dart';

import '../actions/actions.dart';
import '../model/coffee_menu.dart';

class MenuBloc {
  MenuRepository menuRepository;
  var menuState = MenuState();

  final _stateController = StreamController<MenuState>();
  final _actionsController  = StreamController<Action>();

  Stream<MenuState> get state => _stateController.stream;

  Sink<Action> get action => _actionsController .sink;

  MenuBloc(this.menuRepository) {
    _actionsController .stream.listen(_handleEvent);
  }

  void _handleEvent(Action action) async {
    if (action is BuyNot) {
      List<CoffeeMenu> list = menuState.listMenu.map((e) {
        if (e == action.coffeeMenu) {
          CoffeeMenu coffeeMenu =
              CoffeeMenu(e.image, e.name, e.price, isBuy: !e.isBuy);
          return coffeeMenu;
        } else {
          return e;
        }
      }).toList();
      menuState=menuState.copyWith(listMenu: list);
    }else if(action is LoadMenuAction){
      final list = await ConstMenuRepository().getListMenu();
      menuState=menuState.copyWith(listMenu: list);
    }
    _stateController.add(menuState);
  }

  dispose() {
    _stateController.close();
    _actionsController .close();
  }
}
