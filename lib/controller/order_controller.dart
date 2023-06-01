import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hyah_karima/router/app_router.dart';

import '../data/external/cart_database.dart';
import '../model/order_model.dart';

class OrderController extends GetxController {
  //SECTION - static controllers
  static OrderController put =
      Get.put<OrderController>(OrderController(), tag: 'OrderController');
  static OrderController get =
      Get.find<OrderController>(tag: 'OrderController');

  //SECTION -  controllers
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final companyNameController = TextEditingController();
  final governorateIdController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final countryStateController = TextEditingController();
  final postCodeController = TextEditingController();
  final phoneController = TextEditingController();
  final notesController = TextEditingController();
  final emailController = TextEditingController();
//SECTION - variables
  int get governorateValue => int.tryParse(governorateIdController.text) ?? 1;
  void changeGovernorateValue(int? value) {
    governorateIdController.text = value.toString();
    update();
  }

  final formKey = GlobalKey<FormState>();

  void submitOrder(NavigatorState nav) async {
    if (formKey.currentState!.validate()) {
      Order order = Order(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        companyName: companyNameController.text,
        governorateId: int.tryParse(governorateIdController.text),
        address: addressController.text,
        city: cityController.text,
        countryState: countryStateController.text,
        postCode: postCodeController.text,
        phone: phoneController.text,
        notes: notesController.text,
        email: emailController.text,
      );

      var res = await CartDatabase().makeOrder(order);
      printInfo(info: res.toString());
      if (res[1]) {
        Get.snackbar('Order', 'Order has been made successfully',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white);
        nav.pushNamedAndRemoveUntil(MyRouter.homePage, (route) => false);
      } else {
        Get.snackbar('Order', res[0],
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    companyNameController.dispose();
    governorateIdController.dispose();
    addressController.dispose();
    cityController.dispose();
    countryStateController.dispose();
    postCodeController.dispose();
    phoneController.dispose();
    notesController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
