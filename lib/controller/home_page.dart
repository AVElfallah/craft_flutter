import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../data/external/cart_database.dart';

class HomePageController extends GetxController {
  static HomePageController get to =>
      Get.find<HomePageController>(tag: 'HomePageController');
  static HomePageController get put =>
      Get.put<HomePageController>(HomePageController(),
          tag: 'HomePageController');

  PageController pageController = PageController();
  RxInt currentIndex = 0.obs;
  RxString pageTitle = 'HYAH KARIMA'.obs;
  RxInt cartCount = 0.obs;

  @override
  void onInit() async {
    super.onInit();
    cartCount.value =
        ((await CartDatabase().fetchCartItems())?.products!.length) ?? 0;
  }

  void refreshCartCount() async {
    printInfo(info: 'refresh HomePage');
    cartCount.value =
        ((await CartDatabase().fetchCartItems())?.products!.length) ?? 0;
  }

  void changeIndex(int index) {
    currentIndex.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(
        milliseconds: 300,
      ),
      curve: Curves.ease,
    );
  }
}
