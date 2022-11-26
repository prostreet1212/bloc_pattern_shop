import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import 'badge_screen.dart';

class BadgeWidget extends StatelessWidget {
  const BadgeWidget({
    Key? key,
    required this.count,
  }) : super(key: key);
  final String count;

  @override
  Widget build(BuildContext context) {
    print('build badge');
    return Badge(
      badgeContent: Text(count),
      position: const BadgePosition(start: 26, bottom: 26),
      child: IconButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const BadgeScreen();
          }));
        },
        icon: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
