import 'package:bloc_pattern_shop/blocs/menu_bloc.dart';
import 'package:bloc_pattern_shop/model/coffee_menu.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  late MenuBloc menuBloc;

  @override
  void initState() {
    super.initState();
    menuBloc = MenuBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc pattern shop'),
      ),
      body: StreamBuilder<List<CoffeeMenu>>(
        stream: menuBloc.state,
        builder: (_,snapshot){
          return Text('aaa');
        },
      ),
    );
  }

  @override
  void dispose() {
    menuBloc.dispose();
    super.dispose();
  }
}
