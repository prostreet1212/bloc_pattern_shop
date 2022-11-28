import 'package:flutter/material.dart';

import '../actions/actions.dart';
import '../blocs/ui_bloc.dart';
import '../model/coffee_menu.dart';
class MenuWidget extends StatelessWidget {
   MenuWidget({Key? key,required this.listMenu,required this.bloc}) : super(key: key);
  List<CoffeeMenu> listMenu;
   UiBloc bloc;

  @override
  Widget build(BuildContext context) {
    print('build menu widget');
    return GridView.count(
      shrinkWrap: true,
      //primary: false,
      childAspectRatio: MediaQuery.of(context).size.width /
          (MediaQuery.of(context).size.height / 1.5),
      padding:
      const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      crossAxisCount: 2,
      children: listMenu.map(
            (menu) {
          return Card(
            color: const Color.fromARGB(255, 255, 229, 85),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Wrap(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/${menu.image}',
                        fit: BoxFit.fitWidth,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                            alignment: Alignment.center,
                            color:
                            const Color.fromARGB(255, 174, 206, 231),
                            height: 40,
                            width: 40,
                            child: IconButton(
                              icon: Icon(
                                Icons.shopping_basket,
                                color: !menu.isBuy
                                    ? Colors.grey
                                    : Colors.red,
                              ),
                              onPressed: () {
                                bloc.action.add(ChangeBadgeCountAction(menu));
                                bloc.action.add(BuyNot(menu));

                              },
                            )),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      menu.name,
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Цена: '),
                        Text(
                          '${menu.price} руб.',
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          );
        },
      ).toList(),
    );
  }
}
