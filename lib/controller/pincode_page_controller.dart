// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hyah_karima/data/external/rest_password.dart';

class PincodePageController extends ChangeNotifier {
  TextEditingController pin1 = TextEditingController();
  TextEditingController pin2 = TextEditingController();
  TextEditingController pin3 = TextEditingController();
  TextEditingController pin4 = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  int pincode = 0;
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();

  bool isLoading = false;
  bool isPincodeValid = false;

  checkPincode(BuildContext context) {
    isLoading = true;
    notifyListeners();
    if (formKey1.currentState!.validate()) {
      final insertedPin = int.parse(
        pin1.text + pin2.text + pin3.text + pin4.text,
      );

      if (pincode == insertedPin) {
        isPincodeValid = true;
        notifyListeners();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Error Pincode not match!',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        );
      }
    }
    isLoading = false;
    notifyListeners();
  }

  String? pinValidetor(String? val) {
    if (val == null || val.isEmpty) {
      return 'empty';
    }
    return null;
  }

  String? passwordValidator(String? val) {
    if (val!.isEmpty) {
      return 'Please enter your password';
    }
    if (val.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? confirmPasswordValidator(String? val) {
    if (val!.isEmpty) {
      return 'Please enter your password';
    }
    if (val.length < 6) {
      return 'Password must be at least 6 characters';
    }
    if (val != password.text) {
      return 'Password not match';
    }
    return null;
  }

  changePasseword(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    if (formKey2.currentState!.validate()) {
      bool isPasswordChanged =
          await RestPassword.instance.resetPassword(pincode, password.text);

      if (isPasswordChanged) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            duration: Duration(seconds: 4),
            content: Text(
              'Password Changed!',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
        Navigator.of(context).pop();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Error!',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        );
      }
    }
    isLoading = false;
    notifyListeners();
  }
}
