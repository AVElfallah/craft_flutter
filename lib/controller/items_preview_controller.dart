import 'package:get/get.dart';
import 'package:hyah_karima/model/product/product.dart';

import '../data/external/fetch_categories.dart';
import '../data/external/fetch_products.dart';
import '../model/product/categories.dart';

class ItemsPreviewController extends GetxController {
  static ItemsPreviewController to = Get.put<ItemsPreviewController>(
    ItemsPreviewController(),
    tag: 'ItemsPreviewController',
  );
  static ItemsPreviewController get =
      Get.find<ItemsPreviewController>(tag: 'ItemsPreviewController');
  //
  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  RxList<Product> products = <Product>[].obs;
  RxList<int> expectedCategories = <int>[].obs;
  @override
  void refresh() {
    super.refresh();
    printInfo(info: 'refresh ItemsPreviewController');
    expectedCategories.clear();
    fetchCats();
    fetchProducts();
  }

  @override
  void onInit() {
    super.onInit();
    fetchCats();
    fetchProducts();
  }

  void filterByCategory(int id) async {
    if (expectedCategories.contains(id)) {
      expectedCategories.remove(id);
      products.value =
          (await FetchProducts.instance.getAllProducts()).where((element) {
        return !expectedCategories.contains(int.tryParse(element.categoryId!));
      }).toList();
    } else {
      expectedCategories.add(id);
      products.value =
          (await FetchProducts.instance.getAllProducts()).where((element) {
        return !expectedCategories.contains(int.tryParse(element.categoryId!));
      }).toList();
    }
  }

  void fetchCats() async {
    categories.value = await FetchCategoriesFromBackend().getAllCategories();
  }

  void fetchProducts() async {
    products.value = await FetchProducts.instance.getAllProducts();
  }
}
