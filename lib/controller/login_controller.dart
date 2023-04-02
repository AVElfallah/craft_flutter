import 'package:flutter/material.dart';
import 'package:hyah_karima/data/external/login_auth.dart';
import 'package:hyah_karima/data/internal/user_login_data.dart';
import 'package:hyah_karima/model/auth_model.dart';

import '../router/app_router.dart';

class LoginPageController extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  bool isLoading = false;

  loginPressed(BuildContext context) async {
    if (formkey.currentState!.validate()) {
      isLoading = true;
      notifyListeners();
      var auth = await LoginAuth.instance.login(
        emailController.text,
        passwordController.text,
      );
      if (auth.runtimeType == AuthModel) {
        isLoading = false;
        notifyListeners();
        UserAuthLoginData.instance.setAuthModel(auth as AuthModel);
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacementNamed(MyRouter.homePage);
      } else {
        isLoading = false;
        notifyListeners();

        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              "Login failed check your email and password",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            "Fill the form correctly",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
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
