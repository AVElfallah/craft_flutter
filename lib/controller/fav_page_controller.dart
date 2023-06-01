import 'dart:async';

import 'package:get/get.dart';
import 'package:hyah_karima/model/product/product.dart';

import '../data/external/fav_external.dart';

class FavPageController extends GetxController {
  RxList<Product> favProducts = <Product>[].obs;
  @override
  void onInit() {
    super.onInit();
    getAllProductsFav();
    Timer.periodic(const Duration(milliseconds: 2500), (timer) {
      getAllProductsFav();
    });
  }

  RxBool isLoading = false.obs;
  @override
  void refresh() {
    super.refresh();
    getAllProductsFav();
  }

  void getAllProductsFav() async {
    printInfo(info: 'getAllProductsFav');
    isLoading.value = true;
    favProducts.value = await FavExternalDataBase.instance.getAllFav();

    isLoading.value = false;
  }

  void deleteProductFav(String productId) async {
    isLoading.value = true;
    await FavExternalDataBase.instance.deleteFav(productId);
    getAllProductsFav();
    isLoading.value = false;
  }
}
