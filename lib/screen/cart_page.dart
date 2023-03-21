import 'package:flutter/material.dart';
import 'package:hyah_karima/widget/cart_bottom_navbar.dart';

import '../widget/cart_appbar.dart';
import '../widget/cart_itemsamples.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const CartAppBar(),
          Container(
            height: 900,
            padding: const EdgeInsets.only(top: 15),
            // ignore: prefer_const_constructors
            decoration: BoxDecoration(
              color: const Color(0xffEDECF2),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Column(children: [
              const CartItemSamples(),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 248, 247, 249),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 17, 16, 16)
                            .withOpacity(0.6),
                        spreadRadius: 1,
                        blurRadius: 5,
                      ),
                    ]),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        // ignore: prefer_const_constructors
                        Text(
                          "sub_total",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 12, 88, 118),
                          ),
                        ),
                        const Text(
                          "\$100",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 12, 88, 118),
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 20, thickness: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Delivery _",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 12, 88, 118),
                          ),
                        ),
                        Text(
                          "\$20",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 12, 88, 118),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                //// Container(
                // margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                ///  padding: EdgeInsets.all(10),
                // child: Row(
                //    children: [
                //      Container(
                //    decoration: BoxDecoration(
                //       color: Color.fromARGB(217, 166, 98, 9),
                //      borderRadius: BorderRadius.circular(20),
                //   ),
                //  child: Icon(
                //    Icons.add,
                //     color: Colors.white,
                //   ),
                //  ),
                //  Padding(
                //    padding: EdgeInsets.symmetric(horizontal: 10),
                //    child: Text(
                //      "ADD THE ITEM YOU NEED",
                //      style: TextStyle(
                //        fontSize: 18,
                //       fontWeight: FontWeight.bold,
                //       color: Color.fromARGB(217, 166, 98, 9),
                //     ),
                //   ),
                //    ),
                //   ],
              ),

              //   ),
              //  ]),
            ]),
          ),
        ],
      ),
      bottomNavigationBar: const CartBottomNavBar(),
    );
  }
}
