import 'dart:async';

import 'package:bloc_pattern_shop/repository/menu_repository.dart';
import 'package:bloc_pattern_shop/states/app_state.dart';

import '../model/coffee_menu.dart';

/*class MarketingEvent {
  void buyNot(){

  }
 }*/
abstract class Action {}

abstract class MarketingAction extends Action {}

class BuyNot extends MarketingAction {
  final CoffeeMenu coffeeMenu;

  BuyNot(this.coffeeMenu);
}

class MarketingBloc {
  AppState appState =
      AppState(menuList: ConstMenuRepository().listMenu, badgeList: []);

  final _stateController = StreamController<AppState>();
  final _eventsController = StreamController<Action>();

  Stream<AppState> get state => _stateController.stream;

  Sink<Action> get action => _eventsController.sink;

  MarketingBloc() {
    _eventsController.stream.listen(_handleEvent);
  }

  void dispose() {
    _stateController.close();
    _eventsController.close();
  }

  void _handleEvent(Action action) async {
    //menuList.add(CoffeeMenu('image1', 'name1', 4));
    if (action is BuyNot) {
      List<CoffeeMenu> list = appState.menuList.map((e) {
        if(e==action.coffeeMenu){
          e.isBuy=!e.isBuy;
          return e;
        }else{
          return e;
        }
      } ).toList();
      appState = appState.copyWith(
          menuList: list, badgeList: appState.badgeList);
    }
    _stateController.add(appState);
  }
}
