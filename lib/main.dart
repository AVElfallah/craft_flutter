import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hyah_karima/data/internal/app_settings.dart';
import 'package:hyah_karima/router/app_router.dart';

void main() async {
  await GetStorage.init('app_settings');
  await GetStorage.init('user_auth');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var isDark = AppSettingsData.instance.isDarkMode;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: isDark! ? ThemeMode.dark : ThemeMode.light,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      onGenerateRoute: MyRouter.newRoutesSystem,
      initialRoute: MyRouter.introScreen,
    );
  }
}
