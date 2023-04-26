import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hyah_karima/model/auth_model.dart';
import 'package:hyah_karima/router/app_router.dart';

import 'data/internal/user_login_data.dart';

void main() async {
  await GetStorage.init('app_settings');
  await GetStorage.init('user_auth');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AuthModel? authModel = UserAuthLoginData.instance.getAuthModelIfFound();
    return GetMaterialApp(
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      routes: MyRouter.routes,
      initialRoute: /*   authModel == null ? MyRouter.introScreen : */
          MyRouter.review,
    );
  }
}
