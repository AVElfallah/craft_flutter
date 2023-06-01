import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/cart_page_controller.dart';
import '../widget/cart/cart_bottom_navbar.dart';
import '../widget/cart/cart_itemsamples.dart';
import '../widget/cart/cartappbar.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({super.key});

  @override
  Widget build(BuildContext context) {
    var ctrl = Get.put(CartPageController(), tag: 'CartPageController');
    return Scaffold(
      body: SafeArea(
        child: ListView(
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
              child: Obx(
                () => CartItemSamples(
                  products: ctrl.cartModel.value?.products?.toList(),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => CartBottomNavBar(
          total: ctrl.cartModel.value?.total,
        ),
      ),
    );
  }
}
