import 'package:flutter/material.dart';
import 'package:hyah_karima/router/app_router.dart';

import '../data/external/singup_auth.dart';
import '../data/internal/user_login_data.dart';
import '../model/auth_model.dart';
import '../model/singup_model.dart';

class SingUpController extends ChangeNotifier {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  bool isLoading = false;
  int governrateValue = 1;
  changeGovernrate(int? st) {
    governrateValue = st!;
    notifyListeners();
  }

  void register(BuildContext context) async {
    if (formkey.currentState!.validate()) {
      isLoading = true;
      notifyListeners();
      var auth = await SingUpAuth.instance.regesterNewUser(
        SingupModel(
          userName: nameController.text,
          email: emailController.text,
          phoneNumber: numberController.text,
          governorateId: governrateValue,
          password: passwordController.text,
          passwordConfirmation: passwordController.text,
        ),
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
              "error",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  String? govValidator(value) {
    if (value!.isEmpty) {
      return 'Please enter your governorate';
    } else if (!RegExp("[0-9]").hasMatch(value)) {
      return 'governorate id must be only numbers';
    } else if (value.length < 14 || value.length > 14) {
      return 'governorate id must be 14 digits';
    } else {
      return null;
    }
  }

  String? numberValidator(value) {
    if (value!.isEmpty) {
      return 'Please enter your number';
    } else if (!RegExp("[0-9]").hasMatch(value)) {
      return 'Number must be only numbers';
    } else if (value.length < 11) {
      return 'Number must be at least 11 characters';
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

  String? nameValidator(value) {
    if (value!.isEmpty) {
      return 'Please enter your name';
    } else if (value.length < 3) {
      return 'Name must be at least 3 characters';
    } else if (!RegExp("[A-Za-z]|[ا-ى]").hasMatch(value)) {
      return 'Name must be only letters';
    }
    return null;
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
}
