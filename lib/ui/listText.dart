import 'package:flutter/material.dart';

class ListText extends StatelessWidget {
    ListText({Key? key,required this.listText}) : super(key: key);
  String listText;

  @override
  Widget build(BuildContext context) {
    print('build listtext');
    return Text(listText);
  }
}
