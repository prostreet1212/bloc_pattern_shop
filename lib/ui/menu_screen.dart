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
      body: Container(
        child: StreamBuilder<List<CoffeeMenu>>(
          stream: menuBloc.state1,
          builder: (context,snapshot){
            if(snapshot.hasData){
                return Text('${snapshot.data![0].name}');

            }else{
              return Center(child: Text('ничо нету'),);
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    menuBloc.dispose();
    super.dispose();
  }
}
