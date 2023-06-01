import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hyah_karima/router/app_router.dart';

class CartBottomNavBar extends StatelessWidget {
  const CartBottomNavBar({super.key, this.total});
  final double? total;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      height: 100,
      decoration: BoxDecoration(
          color: const Color(0xFFEdEcF2),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 10,
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Total:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 12, 88, 118),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "${total ?? '0'} L.E",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 236, 47, 4),
                ),
              ),
            ],
          ),
          ElevatedButton.icon(
            onPressed: (() {
              Navigator.of(context).pushNamed(
                MyRouter.orderPage,
              );
            }),
            icon: const Icon(CupertinoIcons.cart_badge_plus),
            label: const Text(
              "Order Now",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 14, 66, 86)),
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
