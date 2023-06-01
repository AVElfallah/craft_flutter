import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hyah_karima/screen/rate.dart';
import 'package:hyah_karima/screen/review.dart';

import 'package:hyah_karima/widget/welcome.dart';
import 'package:hyah_karima/screen/reset_password/pincode_page.dart';
import 'package:hyah_karima/screen/reset_password/reset_password_page.dart';

import '../middlewares/intro_screen_middleware.dart';
import '../screen/login_page.dart';
import '../screen/cart_page.dart';
import '../screen/home_page/home_page.dart';
import '../screen/intro_page.dart';
import '../screen/item_page.dart';
import '../screen/likes_page.dart';
import '../screen/order_page.dart';

import '../screen/profile_screen.dart';
import '../screen/home_page/layouts/settings_page.dart';
import '../screen/signup_page.dart';

class MyRouter {
  static const String introScreen = "/";
  static const String pinScreen = "/pin_screen";
  static const String loginPage = "/login_page";
  static const String singupPage = '/singup_page';
  static const String homePage = "/home_page";
  static const String cartPage = "/cart_page";
  static const String itemPage = "/item_page";
  static const String orderPage = "/order_page";
  static const String profileScreen = "/profile_screen";
  static const String settingsPage = "/settings_page";
  static const String likesPage = "/likes_page";
  static const String welcome = "/welcome";
  static const String rate = "/rate";
  static const String review = "/review";
  static const String resetPassword = "/reset_password";

  static Route newRoutesSystem(settings) {
    switch (settings.name) {
      //REVIEW - intro screen path
      //NOTE - in this case intro screen will be the first screen to show if user is not authenticated
      case '/':
        return IntroScreenMiddleware().reRouting();
      case '/pin_screen':
        return GetPageRoute(
          settings: settings,
          page: () => const PincodePage(),
        );
      case '/login_page':
        return GetPageRoute(
          settings: settings,
          page: () => const LoginPage(),
        );
      case '/singup_page':
        return GetPageRoute(
          settings: settings,
          page: () => const SingupPage(),
        );
      case '/home_page':
        return GetPageRoute(
          settings: settings,
          page: () => const HomePage(),
        );
      case '/cart_page':
        return GetPageRoute(
          settings: settings,
          page: () => const Cartpage(),
        );
      case '/item_page':
        return GetPageRoute(
          settings: settings,
          page: () => const ItemPage(),
        );
      case '/order_page':
        return GetPageRoute(
          settings: settings,
          page: () => const OrderPage(),
        );
      case '/profile_screen':
        return GetPageRoute(
          settings: settings,
          page: () => const ProfileScreen(),
        );
      case '/settings_page':
        return GetPageRoute(
          settings: settings,
          page: () => const SettingsPage(),
        );

      case '/likes_page':
        return GetPageRoute(
          settings: settings,
          page: () => const FavPage(),
        );

      case '/welcome':
        return GetPageRoute(
          settings: settings,
          page: () => const Welcome(),
        );
      case '/review':
        return GetPageRoute(
          settings: settings,
          page: () => const Review(),
        );
      case '/rate':
        return GetPageRoute(
          settings: settings,
          page: () => const Rate(),
        );
      case '/reset_password':
        return GetPageRoute(
          settings: settings,
          page: () => const ResetPasswordPage(),
        );
      default:
        return GetPageRoute(
          settings: settings,
          page: () => const IntroScreen(),
        );
    }
  }

  @Deprecated(
      "this is the old routes system \n and this will be removed in the next update \n please use the new routes system")
  static final routes = {
    "/": (context) => const IntroScreen(),
    "/pin_screen": (ontext) => const PincodePage(),
    "/login_page": (ontext) => const LoginPage(),
    '/singup_page': (context) => const SingupPage(),
    "/home_page": (context) => const HomePage(),
    "/cart_page": (context) => const Cartpage(),
    "/item_page": (context) => const ItemPage(),
    "/order_page": (context) => const OrderPage(),
    "/profile_screen": (context) => const ProfileScreen(),
    "/settings_page": (context) => const SettingsPage(),
    "/likes_page": (context) => const FavPage(),
    "/welcome": (context) => const Welcome(),
    "/review": (context) => const Review(),
    "/rate": (context) => const Rate(),
    "/reset_password": (context) => const ResetPasswordPage(),
  };
}
