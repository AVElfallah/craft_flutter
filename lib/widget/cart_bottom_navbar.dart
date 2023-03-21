import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hyah_karima/router/app_router.dart';

class CartBottomNavBar extends StatelessWidget {
  const CartBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      height: 130,
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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Icon(
                  Icons.discount,
                ),
                const Text(
                  "Max sallry:",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 12, 88, 118),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 20, thickness: 3),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Total:",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 12, 88, 118),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "\$250",
                    style: TextStyle(
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
          // Container(
          //    alignment: Alignment.center,
          //     height: 50,
          //    width: double.infinity,
          //     decoration: BoxDecoration(
          //      color: Color.fromARGB(217, 108, 72, 25),
          //      borderRadius: BorderRadius.circular(20),
          //    ),
          //  child: Text(
          //   "check out",
          //   style: TextStyle(
          //    fontSize: 22,
          ////     fontWeight: FontWeight.bold,
          //  color: Colors.white,
          //   ),
          // ),

          //    ),
        ],
      ),
    );
  }
}
