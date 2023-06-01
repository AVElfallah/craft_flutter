import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hyah_karima/model/product/cart_item_model.dart';

import '../data/external/cart_database.dart';
import '../data/external/fav_external.dart';
import '../data/external/fetch_products.dart';
import '../model/product/product.dart';
import '../model/product/review.dart';

class ItemPageController extends GetxController {
  ItemPageController(int selectedColorsLen, int selectedSizeLen, this.product) {
    selectedColors = [for (int i = 0; i < selectedColorsLen; i++) false].obs;
    selectedSizes = [for (int i = 0; i < selectedSizeLen; i++) false].obs;
    checkIsFavValue();
  }

  @override
  void onInit() async {
    super.onInit();
    reviews.value = await FetchProducts.instance.getAllReviewsByID(product.id!);
  }

  late RxList<bool> selectedColors;
  late RxList<bool> selectedSizes;
  late RxBool isFav = false.obs;
  late Product product;
  RxInt selectedQuantity = 1.obs;
  RxBool isFavorite = false.obs;
  RxBool isLoading = false.obs;
  RxList<ReviewModel> reviews = <ReviewModel>[].obs;
  //SECTION - Fav Methods
  void checkIsFavValue() async {
    var res =
        await FavExternalDataBase.instance.checkFav(product.id!.toString());
    isFav.value = res;
  }

  void addToFav() async {
    if (isFav.value) {
      var x =
          await FavExternalDataBase.instance.deleteFav(product.id!.toString());
    } else {
      await FavExternalDataBase.instance.addFav(product.id!.toString());
    }
    checkIsFavValue();
  }

//
  void createReivew(
    String review,
    int rate,
  ) async {
    var res = await FetchProducts.instance.createProductReview(ReviewModel(
      review: review,
      rate: rate.toDouble(),
      productId: product.id.toString(),
    ));
    if (res[1]) {
      Get.back();
      Get.snackbar(
        'Success',
        'Review added successfully',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      Get.snackbar(
        'Error',
        res[0],
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void addToCart(Product prod) async {
    isLoading.value = true;
    if (selectedColors.contains(true) && selectedSizes.contains(true)) {
      CartItemModel item = CartItemModel(
        productId: prod.id,
        productColorId: prod.colors![selectedColors.toList().indexOf(true)].id,
        productSizeId: prod.sizes![selectedSizes.toList().indexOf(true)].id,
        quantity: selectedQuantity.value,
      );
      var res = await CartDatabase().postNewCart(item);
      if (res) {
        isLoading.value = false;
        Get.back();
        Get.snackbar(
          'Success',
          'Item added to cart successfully',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        isLoading.value = false;
        Get.snackbar('Error', 'Something went wrong',
            backgroundColor: Colors.red,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);
      }
    } else {
      isLoading.value = false;
      Get.snackbar(
        'Error',
        'Please select color and size',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void incQuantity() {
    selectedQuantity.value++;
  }

  void decQuantity() {
    if (selectedQuantity.value > 1) {
      selectedQuantity.value--;
    }
  }

  void toggleColor(int color) {
    for (int i = 0; i < selectedColors.length; i++) {
      if (i == color) {
        selectedColors[i] = true;
      } else {
        selectedColors[i] = false;
      }
    }
  }

  void toggleSize(int index) {
    for (int i = 0; i < selectedSizes.length; i++) {
      if (i == index) {
        selectedSizes[i] = true;
      } else {
        selectedSizes[i] = false;
      }
    }
  }
}
