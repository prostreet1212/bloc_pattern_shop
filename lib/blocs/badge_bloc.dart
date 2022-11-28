import 'dart:async';

import 'package:bloc_pattern_shop/states/badge_state.dart';

import '../actions/actions.dart';
import '../model/coffee_menu.dart';

class BadgeBloc {
  var badgeState = BadgeState();

  final _stateController = StreamController<BadgeState>();
  final _actionsController = StreamController<Action>();

  Stream<BadgeState> get state => _stateController.stream;

  Sink<Action> get action => _actionsController.sink;

  BadgeBloc() {
    _actionsController.stream.listen(_handleEvent);
  }

  void _handleEvent(Action action) async {
    if (action is LoadBadgeAction) {
      badgeState = badgeState.copyWith(listBadge: []);
    }else if(action is ChangeBadgeCountAction){
      if(!action.coffeeMenu.isBuy){
        List<CoffeeMenu> list=[...badgeState.listBadge,action.coffeeMenu];
        badgeState=badgeState.copyWith(listBadge: list);
      }else{
        List<CoffeeMenu> list=[...badgeState.listBadge]..remove(action.coffeeMenu);
        badgeState=badgeState.copyWith(listBadge: list);
      }
    }
    _stateController.add(badgeState);
  }

  dispose(){
    _stateController.close();
    _actionsController.close();
  }
}