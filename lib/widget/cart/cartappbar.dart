import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/cart_page_controller.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var ctrl = Get.find<CartPageController>(tag: 'CartPageController');
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              size: 30,
              color: Color.fromARGB(255, 12, 88, 118),
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
          IconButton(
            onPressed: () {
              ctrl.cartEmpty();
            },
            icon: const Icon(
              Icons.delete,
              size: 30,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
