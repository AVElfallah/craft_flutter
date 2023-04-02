// This file contains all the constants used in the app

// login api url
const String loginAPI = "http://10.0.2.2:8000/api/v1/login?";

// register api url
const String registerAPI = "http://10.0.2.2:8000/api/v1/register?";

// forget password api url
const String forgotPasswordAPI = "http://10.0.2.2:8000/api/v1/forget-password?";

// reset password api url
const String resetPasswordAPI = "http://10.0.2.2:8000/api/v1/reset-password?";


/*

SingUpAuth.instance.regesterNewUser(SingupModel(
                              userName: watch.nameController.text,
                              email: watch.emailController.text,
                              phoneNumber: watch.numberController.text,
                              governorateId: int.tryParse(
                                      watch.governorateController.text) ??
                                  0,
                              password: watch.passwordController.text));

*/