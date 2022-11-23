import 'dart:async';

import 'package:bloc_pattern_shop/repository/menu_repository.dart';

import '../model/coffee_menu.dart';

enum MenuEvent { buyNot }

class MenuBloc {
  List<CoffeeMenu> menuList = ConstMenuRepository().listMenu;

  final _stateController = StreamController<List<CoffeeMenu>>();
  final _eventsController = StreamController<MenuEvent>();

  Stream<List<CoffeeMenu>> get state => _stateController.stream;

  Sink<MenuEvent> get action => _eventsController.sink;

  MenuBloc() {
    _eventsController.stream.listen(_handleEvent);
  }

  void dispose(){
    _stateController.close();
    _eventsController.close();
  }

  void _handleEvent(MenuEvent action) async {}
}
