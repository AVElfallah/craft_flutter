import 'package:flutter/material.dart';

import '../router/app_router.dart';

class LoginPageController extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  loginPressed(BuildContext context) {
    if (formkey.currentState!.validate()) {
      debugPrint("sucess");
      emailController.clear();
      passwordController.clear();
      Navigator.of(context).pushNamed(MyRouter.homePage);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("validation failed"),
        ),
      );
    }
  }

  String? emailValidator(value) {
    RegExp emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (value!.isEmpty) {
      return 'Please enter your email';
    } else if (!(emailRegex.hasMatch(value))) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? passwordValidator(value) {
    if (value!.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
}
