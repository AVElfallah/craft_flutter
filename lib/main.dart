import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hyah_karima/router/app_router.dart';

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
    return MaterialApp(
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(brightness: Brightness.dark
          // scaffoldBackgroundColor: Colors.white,
          ),
      routes: MyRouter.routes,
    );
  }
}
