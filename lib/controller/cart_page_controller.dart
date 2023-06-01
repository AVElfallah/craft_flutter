import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hyah_karima/data/external/cart_database.dart';

import '../model/product/cart_model.dart';

class CartPageController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    cartModel.value = (await CartDatabase().fetchCartItems()) ??
        CartModel(
          products: [],
          total: 0,
        );
  }

  late Rx<CartModel?> cartModel = CartModel().obs;

  void updateCart() async {
    cartModel.value = (await CartDatabase().fetchCartItems()) ??
        CartModel(
          products: [],
          total: 0,
        );
  }

  void cartEmpty() async {
    var res = await CartDatabase().emptyCart(0);
    if (res[1]) {
      updateCart();
      Get.snackbar(
        'Success',
        res[0],
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        'Error',
        res[0],
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
      );
    }
  }

  void deleteSingleItemFromCart(int productID) async {
    var res = await CartDatabase().deleteItemFromCart(productID);

    if (res[1]) {
      updateCart();
      Get.snackbar(
        'Success',
        res[0],
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        'Error',
        res[0],
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
      );
    }
  }
}
