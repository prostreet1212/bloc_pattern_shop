import 'dart:async';

import 'package:bloc_pattern_shop/blocs/badge_bloc.dart';
import 'package:bloc_pattern_shop/blocs/menu_bloc.dart';
import 'package:bloc_pattern_shop/states/app_state.dart';

import '../actions/actions.dart';

class UiBloc{
  MenuBloc menuBloc;
  BadgeBloc badgeBloc;

  AppState appState=const AppState();

  final _stateController = StreamController<AppState>();
  final _actionsController  = StreamController<Action>();

  Stream<AppState> get state => _stateController.stream;
  Sink<Action> get action => _actionsController.sink;


  UiBloc(this.menuBloc,this.badgeBloc){
    menuBloc.state.listen((state) {
      appState = appState.copyWith(menuState: state);
      _stateController.add(appState);
    });
    badgeBloc.state.listen((state) {
      appState=appState.copyWith(badgeState: state);
      _stateController.add(appState);
    });
    _actionsController.stream.listen((action) {
      if(action is MenuAction){
        menuBloc.action.add(action);
      }else if(action is BadgeAction){
        badgeBloc.action.add(action);
      }
    });
  }

  dispose(){
    menuBloc.dispose();
    badgeBloc.dispose();
    _stateController.close();
    _actionsController .close();
  }

}