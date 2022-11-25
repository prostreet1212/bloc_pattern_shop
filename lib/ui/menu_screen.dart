import 'package:bloc_pattern_shop/blocs/menu_bloc.dart';
import 'package:bloc_pattern_shop/model/coffee_menu.dart';
import 'package:bloc_pattern_shop/states/app_state.dart';
import 'package:bloc_pattern_shop/ui/listText.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  MenuScreenState createState() => MenuScreenState();
}

class MenuScreenState extends State<MenuScreen> {
  late MarketingBloc marketingBloc;

  @override
  void initState() {
    super.initState();
    marketingBloc = MarketingBloc();
  }

  @override
  Widget build(BuildContext context) {
    print('build menuscreen');
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc pattern shop'),
      ),
      body: StreamBuilder<AppState>(
          initialData: marketingBloc.appState,
          stream: marketingBloc.state,
          builder: (_, snapshot) {
            List<CoffeeMenu> listMenu = snapshot.data!.menuList;
            return GridView.count(
                shrinkWrap: true,
                //primary: false,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.5),
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                crossAxisCount: 2,
                children: snapshot.data!.menuList.map(
                  (menu) {
                    return Card(
                      color: Color.fromARGB(255, 255, 229, 85),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Wrap(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
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
                                    color: Color.fromARGB(255, 174, 206, 231),
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
                                        marketingBloc.action.add(BuyNot(menu));
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                menu.name,
                                textAlign: TextAlign.center,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Цена: '),
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
                ).toList());
          },
        ),

      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: Icon(Icons.add),
        onPressed: () {
          //marketingBloc.action.add(MarketingEvent.increase);
          //menuBloc.action.add(MenuEvent.buyNot);
        },
      ),
    );
  }

  @override
  void dispose() {
    marketingBloc.dispose();
    super.dispose();
  }
}
