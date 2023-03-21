import 'package:flutter/material.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            // ignore: prefer_const_constructors
            child: Icon(
              Icons.arrow_back,
              size: 30,
              color: const Color.fromARGB(255, 12, 88, 118),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              " Cart",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Color.fromARGB(255, 12, 88, 118),
              ),
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.notification_add,
            size: 30,
            color: Color.fromARGB(255, 12, 88, 118),
          ),
        ],
      ),
    );
  }
}
