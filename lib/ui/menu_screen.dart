import 'package:bloc_pattern_shop/actions/actions.dart';
import 'package:bloc_pattern_shop/states/app_state.dart';
import 'package:bloc_pattern_shop/ui/badge_widget.dart';
import 'package:bloc_pattern_shop/ui/menu_widget.dart';
import 'package:flutter/material.dart';

import '../blocs/ui_bloc.dart';

class MenuScreen extends StatefulWidget {
  final Function _blocBuilder;

  const MenuScreen(this._blocBuilder);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  late final UiBloc _bloc;

  @override
  void initState() {
    _bloc = widget._blocBuilder();
    _bloc.action.add(LoadMenuAction());
    _bloc.action.add(LoadBadgeAction());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AppState>(
        // initialData: _bloc.appState,
        stream: _bloc.state,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text('Bloc pattern shop'),
                leading: BadgeWidget(listBadge: snapshot.data!.badgeState.listBadge,bloc: _bloc,),
              ),
              body: MenuWidget(listMenu: snapshot.data!.menuState.listMenu,bloc: _bloc,),
            );
          }
        });
  }
}
