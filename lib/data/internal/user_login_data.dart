import 'package:get_storage/get_storage.dart';

import '../../model/auth_model.dart';

class UserAuthLoginData {
  //singleton pattern to make only one connection to the database
  UserAuthLoginData._();
  static final UserAuthLoginData _userLoginData = UserAuthLoginData._();
  static UserAuthLoginData get instance => _userLoginData;
  //instance of the database
  final box = GetStorage('user_auth');
  //get the token from the database
  String? get token => box.read<String>('token');
  //reset the database
  void reset() {
    box.erase();
  }

  //save the token in the database
  void setAuthModel(AuthModel authModel) {
    box.write('token', authModel.token);
    box.write('id', authModel.client?.id);
    box.write('user_name', authModel.client?.userName);
    box.write('email', authModel.client?.email);
    box.write('pin_code', authModel.client?.pincode);
    box.write('status', authModel.client?.status);
    box.write('governorate_id', authModel.client?.governorateID);
    box.write(
        'created_at', authModel.client?.createdAt?.millisecondsSinceEpoch);
    box.write(
        'updated_at', authModel.client?.updatedAt?.millisecondsSinceEpoch);
    box.save();
  }

  // get the AuthModel from the database if the token is not null
  AuthModel? getAuthModelIfFound() {
    if (token != null) {
      return AuthModel.fromMap(
        {
          'token': token,
          'client': {
            'id': box.read('id'),
            'user_name': box.read('user_name'),
            'email': box.read('email'),
            'pin_code': box.read('pin_code'),
            'status': box.read('status'),
            'governorate_id': box.read('governorate_id'),
            'created_at': DateTime.fromMillisecondsSinceEpoch(
              box.read<int>('created_at') ?? 0,
            ),
            'updated_at': DateTime.fromMillisecondsSinceEpoch(
              box.read<int>('updated_at') ?? 0,
            ),
          },
        },
      );
    } else {
      return null;
    }
  }
}
