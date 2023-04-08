import 'package:flutter/material.dart';
import 'package:hyah_karima/router/app_router.dart';
import 'package:badges/badges.dart' as badges;

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.list_rounded,
              size: 30,
              color: Color.fromARGB(255, 12, 88, 118),
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 10,
            ),
            child: Text(
              "HYAH KARIMA",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 7, 104, 142),
              ),
            ),
          ),
          const Spacer(),
          badges.Badge(
            badgeContent: const Text(
              "3",
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            position: badges.BadgePosition.topEnd(top: 0, end: 3),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  MyRouter.cartPage,
                );
              },
              child: const Icon(
                Icons.shopping_basket_outlined,
                size: 32,
                color: Color.fromARGB(255, 12, 88, 118),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
