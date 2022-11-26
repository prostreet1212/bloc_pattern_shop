import 'package:flutter/material.dart';

class ListText extends StatelessWidget {
  const ListText({Key? key, required this.listText}) : super(key: key);
  final String listText;

  @override
  Widget build(BuildContext context) {
    print('build listtext');
    return Text(listText);
  }
}
