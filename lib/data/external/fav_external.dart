import 'package:dio/dio.dart';
import 'package:hyah_karima/extensions/constant.dart';
import 'package:hyah_karima/model/product/product.dart';

import '../internal/user_login_data.dart';

class FavExternalDataBase {
  FavExternalDataBase._();
  static final FavExternalDataBase _instance = FavExternalDataBase._();
  static FavExternalDataBase get instance => _instance;
  var tok = UserAuthLoginData.instance.token;

  //SECTION - check fav
  Future<bool> checkFav(String productId) async {
    try {
      var res = await Dio(
        BaseOptions(
          baseUrl: checkIsFavAPI,
          headers: {
            "Authorization": 'Bearer $tok',
          },
        ),
      ).get(
        '',
        queryParameters: {
          'product_id': productId,
        },
      );

      if (res.data["done"] == false) {
        return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  //SECTION - delete fav

  Future<bool> deleteFav(String productId) async {
    try {
      var res = await Dio(
        BaseOptions(
          baseUrl: deleteFavAPI,
          headers: {
            "Authorization": 'Bearer $tok',
          },
        ),
      ).post(
        '',
        queryParameters: {
          'product_id': productId,
        },
      );
      if ((res.data)['done'] == false) {
        return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  //SECTION - add fav
  Future<bool> addFav(String productId) async {
    try {
      var res = await Dio(
        BaseOptions(
          baseUrl: addFavAPI,
          headers: {
            "Authorization": 'Bearer $tok',
          },
        ),
      ).post(
        '',
        queryParameters: {
          'product_id': productId,
        },
      );

      if ((res.data)['done'] == false) {
        return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  //SECTION - get fav
  Future<List<Product>> getAllFav() async {
    print('fetching favs');
    try {
      var res = await Dio(
        BaseOptions(
          baseUrl: getAllUserFavAPI,
          headers: {
            "Authorization": 'Bearer $tok',
          },
        ),
      ).get('');
      var products = (res.data['data'] as List);
      List<Product> productsList =
          products.map((e) => Product.fromJson(e)).toList();
      return productsList;
    } catch (e) {
      return <Product>[];
    }
  }
}
