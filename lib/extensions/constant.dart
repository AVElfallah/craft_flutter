// This file contains all the constants used in the app

// login api url
const String loginAPI = "http://10.0.2.2:8000/api/v1/login?";

// register api url
const String registerAPI = "http://10.0.2.2:8000/api/v1/register?";

// forget password api url
const String forgotPasswordAPI = "http://10.0.2.2:8000/api/v1/forget-password?";

// reset password api url
const String resetPasswordAPI = "http://10.0.2.2:8000/api/v1/reset-password?";

const String fetchCategoriesAPI = "http://10.0.2.2:8000/api/v1/categories?";

const String fetchProductsAPI = "http://10.0.2.2:8000//api/v1/all-products";

const String fetchReviewsAPI = 'http://10.0.2.2:8000/api/v1/get-reviews';

const String postCartAPI = "http://10.0.2.2:8000/api/v1/create-cart?";

const String fetchCartDetailsAPI = "http://10.0.2.2:8000/api/v1/create-details";

const String deleteCartItemAPI = 'http://10.0.2.2:8000/api/v1/delete-item-cart';

const String makeOrderAPI = "http://10.0.2.2:8000/api/v1/create-order";

const String makeReviewAPI = "http://10.0.2.2:8000/api/v1/make-review";

const String checkIsFavAPI = "http://10.0.2.2:8000/api/v1/check-fav";

const String getAllUserFavAPI = "http://10.0.2.2:8000/api/v1/get-fav";

const String addFavAPI = "http://10.0.2.2:8000/api/v1/post-fav";

const String deleteFavAPI = "http://10.0.2.2:8000/api/v1/delete-fav";

String getImageUrl(String imagePath) {
  return "http://10.0.2.2:8000/$imagePath";
}

RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
