import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hyah_karima/extensions/constant.dart';

import '../data/external/rest_password.dart';
import '../router/app_router.dart';

class ResetPasswordController extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  void forgotPassword(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    if (formKey.currentState!.validate()) {
      final x = await RestPassword.instance.forgotPassword(
        emailController.text,
      );
      if (x[0]) {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacementNamed(
          MyRouter.pinScreen,
          arguments: {
            "pin": x[1],
          },
        );
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error!'),
          ),
        );
      }
    }
    isLoading = false;
    notifyListeners();
  }
}
