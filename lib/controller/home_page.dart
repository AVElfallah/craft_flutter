import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  static HomePageController get to => Get.find<HomePageController>();
  static HomePageController get put =>
      Get.put<HomePageController>(HomePageController());

  PageController pageController = PageController();
  RxInt currentIndex = 0.obs;
  RxString pageTitle = 'HYAH KARIMA'.obs;

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
