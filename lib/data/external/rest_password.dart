import 'package:dio/dio.dart';
import 'package:hyah_karima/extensions/constant.dart';

class RestPassword {
  //REVIEW - this is a singleton class
  // wich is used to make connection more secure
  RestPassword._();
  static final RestPassword _restPassword = RestPassword._();
  static RestPassword get instance => _restPassword;

  forgotPassword(String? email) async {
    final dio = Dio(BaseOptions(baseUrl: forgotPasswordAPI));
    try {
      final res = await dio.post(
        '',
        data: {
          "email": email,
        },
      );

      return [res.data['status'] == 1, res.data['data']['pin_code']];
    } catch (e) {
      return [false];
    }
  }

  resetPassword(int pincode, String? password) async {
    final dio = Dio(BaseOptions(baseUrl: resetPasswordAPI));
    try {
      var res = await dio.post('', data: {
        "pin_code": pincode,
        "password": password,
        "password_confirmation": password
      });
      if (res.data['status'] == 1) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
