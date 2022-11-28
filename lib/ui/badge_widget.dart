import 'package:badges/badges.dart';
import 'package:bloc_pattern_shop/blocs/ui_bloc.dart';
import 'package:flutter/material.dart';

import '../model/coffee_menu.dart';
class BadgeWidget extends StatelessWidget {
   BadgeWidget({Key? key,required this.listBadge,required this.bloc}) : super(key: key);
  List<CoffeeMenu> listBadge;
  UiBloc bloc;


  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: const Text('Flutter_bloc_shop'),
        leading: Badge(
          badgeContent: Text(listBadge.length.toString()),
          position: const BadgePosition(start: 26, bottom: 26),
          child: IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return  Container();
                  }));
            },
          ),
        ));
  }
}
