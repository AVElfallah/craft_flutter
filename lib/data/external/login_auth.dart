import 'package:dio/dio.dart';
import 'package:hyah_karima/extensions/constant.dart';

import '../../model/auth_model.dart';

class LoginAuth {
  LoginAuth._();
  static final _i = LoginAuth._();
  static LoginAuth get instance => _i;

  login(String email, String password) async {
    var dio = Dio(
      BaseOptions(
        baseUrl: loginAPI,
      ),
    );

    var reapose = await dio.post("email=$email&password=$password");

    if (reapose.data['status'] == 0) {
      return false;
    } else {
      AuthModel authModel = AuthModel.fromMap(
        reapose.data['data'],
      );

      return authModel;
    }
  }
}
