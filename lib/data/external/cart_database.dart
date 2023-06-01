import 'package:dio/dio.dart';
import 'package:hyah_karima/data/internal/user_login_data.dart';
import 'package:hyah_karima/extensions/constant.dart';
import 'package:hyah_karima/model/product/cart_item_model.dart';
import 'package:hyah_karima/model/product/cart_model.dart';

import '../../model/order_model.dart';

class CartDatabase {
  CartDatabase._();
  static final CartDatabase _db = CartDatabase._();
  factory CartDatabase() => _db;
  var tok = UserAuthLoginData.instance.token;

  //SECTION - Method to Create New Cart
  Future<bool> postNewCart(CartItemModel item) async {
    var res = await Dio(BaseOptions(baseUrl: postCartAPI, headers: {
      "Authorization": 'Bearer $tok',
    })).post('', queryParameters: {
      'product_id': item.productId,
      'product_color_id': item.productColorId,
      'product_size_id': item.productSizeId,
      'quantity': item.quantity,
    });
    if (res.data["status"] == 1) {
      return true;
    }
    return false;
  }

  //SECTION - Method to Delete item from Cart
  Future<List> deleteItemFromCart(productID) async {
    try {
      var res = await Dio(BaseOptions(baseUrl: deleteCartItemAPI, headers: {
        "Authorization": 'Bearer $tok',
      })).post('', queryParameters: {
        'product_id': productID,
        'type': 'single',
      });
      return [
        res.data["message"].toString(),
        res.data["message"] == "item deleted successfully"
      ];
    } catch (e) {
      return [e.toString(), false];
    }
  }

  //SECTION - Method to Delete All items from Cart
  Future<List> emptyCart(productID) async {
    try {
      var res = await Dio(
        BaseOptions(
          baseUrl: deleteCartItemAPI,
          headers: {
            "Authorization": 'Bearer $tok',
          },
        ),
      ).post(
        '',
        queryParameters: {
          'product_id': productID,
        },
      );
      return [
        res.data["message"].toString(),
        res.data["message"] == "cart empty successfully"
      ];
    } catch (e) {
      return [e.toString(), false];
    }
  }

  //SECTION - Method to Get All Carts
  Future<CartModel?> fetchCartItems() async {
    try {
      var res = await Dio(BaseOptions(
          baseUrl: fetchCartDetailsAPI,
          headers: {"Authorization": 'Bearer $tok', 'Lang': 'en'})).get('');

      var cart = CartModel.fromJson(res.data);

      return cart;
    } catch (e) {
      return null;
    }
  }

  //SECTION -  finshing order

  Future<List> makeOrder(Order order) async {
    try {
      var res = await Dio(
        BaseOptions(
          baseUrl: makeOrderAPI,
          headers: {
            "Authorization": 'Bearer $tok',
            'Lang': 'en',
          },
        ),
      ).post(
        '',
        queryParameters: order.toJson(),
      );

      return [
        res.data["message"].toString(),
        res.data["message"] == "success" && res.data['status'] == 1
      ];
    } catch (e) {
      return [e.toString(), false];
    }
  }
}
