import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hyah_karima/extensions/constant.dart';
import 'package:hyah_karima/model/auth_model.dart';
import 'package:hyah_karima/model/singup_model.dart';

class SingUpAuth {
  SingUpAuth._();
  static final _i = SingUpAuth._();
  static SingUpAuth get instance => _i;

  regesterNewUser(SingupModel user) async {
    var dio = Dio(
      BaseOptions(
        baseUrl: registerAPI,
      ),
    );
    try {
      var reapose = await dio.post(
        "email=${user.email}&"
        "password=${user.password}&"
        "password_confirmation=${user.passwordConfirmation}&"
        "user_name=${user.userName}&"
        "phone_number=${user.phoneNumber}&"
        "governorate_id=${2}",
      );
      debugPrint(reapose.data.toString());
      if (reapose.data['status'] == 0) {
        debugPrint(reapose.data);
        return false;
      } else {
        debugPrint(reapose.data.toString());
        AuthModel authModel = AuthModel.fromMap(
          reapose.data['data'],
        );

        return authModel;
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
