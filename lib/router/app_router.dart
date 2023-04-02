import '../screen/login_page.dart';
import '../screen/cart_page.dart';
import '../screen/fakhar_page.dart';
import '../screen/home_page.dart';
import '../screen/intro_page.dart';
import '../screen/item_page.dart';
import '../screen/likes_page.dart';
import '../screen/new_proudcts_page.dart';
import '../screen/order_page.dart';
import '../screen/pin_screen.dart';
import '../screen/profile_screen.dart';
import '../screen/settings_page.dart';
import '../screen/signup_page.dart';
import '../widget/about_widget.dart';

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
  static const String fakharItem = "/fakhar_item";
  static const String newProudctsPage = "/newproudcts_page";
  static const String likesPage = "/likes_page";
  static const String aboutWidget = "/about_page";

  static final routes = {
    "/": (context) => const IntroScreen(),
    "/pin_screen": (ontext) => const PinScreeen(),
    "/login_page": (ontext) => const LoginPage(),
    '/singup_page': (context) => const SingupPage(),
    "/home_page": (context) => const HomePage(),
    "/cart_page": (context) => const Cartpage(),
    "/item_page": (context) => const ItemPage(),
    "/order_page": (context) => const OrderPage(),
    "/profile_screen": (context) => const ProfileScreen(),
    "/settings_page": (context) => const SettingsPage(),
    "/fakhar_item": (ontext) => const Fakharitem(),
    "/newproudcts_page": (context) => const NewProudctsPage(),
    "/likes_page": (context) => const LikesPage(),
    "/about_page": (context) => const AboutWidget(),
  };
}