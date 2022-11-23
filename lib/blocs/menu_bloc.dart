
import 'dart:async';


import 'package:bloc_pattern_shop/repository/menu_repository.dart';

import '../model/coffee_menu.dart';

enum MenuEvent { buyNot }

class MenuBloc {
  //List<CoffeeMenu> menuList = [CoffeeMenu('image', 'name', 3)];
  int menuList=1;

  final _stateController = StreamController<int>();
  final _eventsController = StreamController<MenuEvent>();

  Stream<int> get state1 => _stateController.stream;

  Sink<MenuEvent> get action => _eventsController.sink;

  MenuBloc() {
    _eventsController.stream.listen(_handleEvent);
  }

  void dispose() {
    _stateController.close();
    _eventsController.close();
  }

  void _handleEvent(MenuEvent action) async {
    if(action==MenuEvent.buyNot){
     // menuList.add(CoffeeMenu('image1', 'name1', 4));
      menuList++;
    }
    _stateController.add(menuList);
  }
}
