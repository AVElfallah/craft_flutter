// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:hyah_karima/controller/login_controller.dart';
import 'package:hyah_karima/extensions/assestent_extension.dart';
import 'package:provider/provider.dart';

import '../router/app_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

//enum Authmode { SignUp, Login }

class _LoginPageState extends State<LoginPage> {
  bool visible = true;
  Color x1 = const Color.fromARGB(255, 184, 5, 5);
/////////////////////////////////////////////////////////

  //final _formfield = GlobalKey<FormState>();
  //void validate() {
  // if (formKey.currentState!.validate()) {
  //  debugPrint("ok");
  // } else {
  //   debugPrint("error");
  // }
  // }

  Map<String, String> authdata = {
    'e-mail': '',
    'Password': '',
  };

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginPageController>(
      create: (context) => LoginPageController(),
      builder: (context, _) {
        final watch = context.watch<LoginPageController>();
        final read = context.read<LoginPageController>();
        return Scaffold(
          body: ListView(
            children: [
              Form(
                key: watch.formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50),
                            ),
                          ),
                        ),
                        Center(
                          child: Column(
                            children: <Widget>[
                              70.hSizedBox,
                              const Text(
                                '',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 35,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Image.asset(
                                'images/88.png',
                                height: 170,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: watch.emailController,
                            decoration: const InputDecoration(
                              icon: Icon(
                                Icons.email_rounded,
                                color: Color.fromARGB(
                                  255,
                                  1,
                                  124,
                                  106,
                                ),
                              ),
                              // border: OutlineInputBorder(),
                              labelText: 'e-mail',
                              labelStyle: TextStyle(
                                fontSize: 25,
                                color: Color.fromARGB(
                                  255,
                                  104,
                                  101,
                                  101,
                                ),
                              ),
                              hintText: 'example@gmail.com',
                              hintStyle: TextStyle(fontSize: 20),
                            ),
                            validator: read.emailValidator,
                            onSaved: (value) {
                              authdata['e-mail'] = value!; //(!) null safty
                              debugPrint(authdata['e-mail']);
                            },
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          StatefulBuilder(
                            builder: (context, changeState) {
                              return TextFormField(
                                controller: watch.passwordController,
                                validator: watch.passwordValidator,
                                decoration: InputDecoration(
                                  icon: const Icon(
                                    Icons.vpn_key_rounded,
                                    color: Color.fromARGB(
                                      255,
                                      1,
                                      124,
                                      106,
                                    ),
                                  ),
                                  // border: OutlineInputBorder(),
                                  labelText: 'Password',
                                  labelStyle: const TextStyle(
                                    fontSize: 25,
                                    color: Color.fromARGB(
                                      255,
                                      104,
                                      101,
                                      101,
                                    ),
                                  ),
                                  hintText: 'Enter Your Password',
                                  hintStyle: const TextStyle(fontSize: 25),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      changeState(() {
                                        visible = !visible;
                                      });
                                    },
                                    icon: Icon(
                                      visible
                                          ? Icons.visibility_off_rounded
                                          : Icons.visibility,
                                    ),
                                  ),
                                ),
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: visible,
                              );
                            },
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                            height: 60,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () => read.loginPressed(context),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.white,
                                ),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      50,
                                    ),
                                  ),
                                ),
                              ),
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                  color: Color.fromARGB(
                                    255,
                                    1,
                                    124,
                                    106,
                                  ),
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have an account?",
                                style: TextStyle(
                                  color: Color.fromARGB(
                                    255,
                                    2,
                                    2,
                                    2,
                                  ),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacementNamed(
                                    MyRouter.singupPage,
                                  );
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    Colors.white,
                                  ),
                                ),
                                child: const Text(
                                  ' Register Now',
                                  style: TextStyle(
                                    color: Color.fromARGB(
                                      255,
                                      7,
                                      104,
                                      142,
                                    ),
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
