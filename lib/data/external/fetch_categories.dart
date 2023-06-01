import 'package:dio/dio.dart';
import 'package:hyah_karima/extensions/constant.dart';

import '../../model/product/categories.dart';

class FetchCategoriesFromBackend {
  FetchCategoriesFromBackend._();
  static final FetchCategoriesFromBackend _instance =
      FetchCategoriesFromBackend._();
  factory FetchCategoriesFromBackend() => _instance;

  Future<List<CategoryModel>> getAllCategories() async {
    try {
      var rse = await Dio(
        BaseOptions(baseUrl: fetchCategoriesAPI),
      ).get('');
      List catmap = (rse.data as Map)['data']['categories'];

      List<CategoryModel> categories =
          catmap.map((e) => CategoryModel.fromJson(e)).toList();
      return categories;
    } catch (e) {
      return [];
    }
  }
}
