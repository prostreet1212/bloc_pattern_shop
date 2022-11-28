
import 'package:bloc_pattern_shop/blocs/badge_bloc.dart';
import 'package:bloc_pattern_shop/blocs/menu_bloc.dart';
import 'package:bloc_pattern_shop/blocs/ui_bloc.dart';
import 'package:bloc_pattern_shop/repository/menu_repository.dart';
import 'package:bloc_pattern_shop/ui/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuRepository=ConstMenuRepository();
    final menuBloc=MenuBloc(menuRepository);
    final badgeBloc=BadgeBloc();
    return   MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MenuScreen(()=>UiBloc(menuBloc,badgeBloc)),
    );

  }
}
