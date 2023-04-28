import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hyah_karima/screen/home_page/home_page.dart';
import 'package:hyah_karima/screen/login_page.dart';

import '../data/internal/user_login_data.dart';
import '../model/auth_model.dart';

class IntroScreenMiddleware extends GetMiddleware {
  AuthModel? authModel = UserAuthLoginData.instance.getAuthModelIfFound();

  GetPageRoute reRouting() {
    if (authModel != null) {
      return GetPageRoute(
        page: () => const HomePage(),
        settings: const RouteSettings(
          name: '/home_page',
        ),
      );
    } else {
      return GetPageRoute(
        page: () => const LoginPage(),
        settings: const RouteSettings(
          name: '/login_page',
        ),
      );
    }
  }
}
