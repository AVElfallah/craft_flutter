import 'package:dio/dio.dart';
import 'package:hyah_karima/extensions/constant.dart';
import 'package:hyah_karima/model/product/product.dart';
import 'package:hyah_karima/model/product/review.dart';

import '../internal/user_login_data.dart';

class FetchProducts {
  FetchProducts._();
  static final FetchProducts _instance = FetchProducts._();

  static FetchProducts get instance => _instance;
  var tok = UserAuthLoginData.instance.token;

  Future<List> createProductReview(ReviewModel reviewModel) async {
    try {
      var res = await Dio(
        BaseOptions(
          baseUrl: makeReviewAPI,
          headers: {
            "Authorization": 'Bearer $tok',
          },
        ),
      ).post(
        '',
        queryParameters: {
          'product_id': reviewModel.productId,
          'review': reviewModel.review,
          'rate': reviewModel.rate,
        },
      );

      return [res.data['message'], res.data['status'] == 1];
    } catch (e) {
      return [e.toString(), false];
    }
  }

  Future<List<ReviewModel>> getAllReviewsByID(int id) async {
    try {
      var res = await Dio(BaseOptions(baseUrl: fetchReviewsAPI)).get(
        '',
        queryParameters: {
          'product_id': id,
        },
      );
      var reviews = (res.data['data']['reviews'] as List);
      print(reviews);
      List<ReviewModel> reviewsList =
          reviews.map((e) => ReviewModel.fromJson(e)).toList();
      print(reviewsList);
      return reviewsList;
    } catch (e) {
      return [];
    }
  }

  Future<List<Product>> getAllProducts() async {
    var res = await Dio(BaseOptions(baseUrl: fetchProductsAPI)).get('');
    var products = (res.data['data']['products']['data'] as List);

    List<Product> productsList =
        products.map((e) => Product.fromJson(e)).toList();

    return productsList;
  }
}
