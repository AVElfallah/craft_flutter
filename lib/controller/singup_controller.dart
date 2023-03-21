import 'dart:math';

import 'package:flutter/material.dart';

class SingUpController extends ChangeNotifier {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  TextEditingController governorateController = TextEditingController();

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
