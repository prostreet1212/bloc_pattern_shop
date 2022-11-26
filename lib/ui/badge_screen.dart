import 'package:bloc_pattern_shop/states/app_state.dart';
import 'package:flutter/material.dart';
import '../model/coffee_menu.dart';

class BadgeScreen extends StatefulWidget {
   const BadgeScreen({Key? key,}) : super(key: key);
  @override
  State<BadgeScreen> createState() => _BadgeScreenState();
}

class _BadgeScreenState extends State<BadgeScreen> {

  late List<CoffeeMenu> badgeList;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AppState>(
        //initialData: marketingBloc.appState,
        //stream: marketingBloc.state,
        builder: (_, snaphot) {
          badgeList = snaphot.data!.badgeList;
          return Scaffold(
            appBar: AppBar(
              title: const Text('Корзина'),
              centerTitle: true,
            ),
            body: badgeList.isEmpty
                ? const Center(
                    child: Text(
                      'Корзина пуста',
                      style: TextStyle(fontSize: 24),
                    ),
                  )
                : Column(
                    children: [
                      Expanded(
                          flex: 12,
                          child: ListView.builder(
                              itemCount: badgeList.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  color: Colors.yellow,
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: 200,
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/${badgeList[index].image}',
                                          fit: BoxFit.fitWidth,
                                        ),
                                        Expanded(
                                            child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                badgeList[index].name,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                              Text(
                                                  'Цена: ${badgeList[index].price} руб.',
                                                  style: const TextStyle(
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontSize: 16))
                                            ],
                                          ),
                                        )),
                                      ],
                                    ),
                                  ),
                                );
                              })),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.black),
                            ),
                            child: const Text(
                              'Оформить заказ',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              //showToast('Заказ успешно выполнен');
                            },
                          ),
                        ),
                      )
                    ],
                  ),
          );
        });
  }
}
