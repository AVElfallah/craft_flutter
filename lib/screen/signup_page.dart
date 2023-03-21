import 'package:flutter/material.dart';
import 'package:hyah_karima/extensions/assestent_extension.dart';
import 'package:hyah_karima/router/app_router.dart';
import 'package:provider/provider.dart';
import 'package:hyah_karima/controller/singup_controller.dart';

class SingupPage extends StatefulWidget {
  const SingupPage({Key? key}) : super(key: key);

  @override
  State<SingupPage> createState() => _SingupPageState();
}

class _SingupPageState extends State<SingupPage> {
  Color x1 = const Color.fromARGB(255, 184, 5, 5);
  bool isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SingUpController>(
        create: (context) => SingUpController(),
        builder: (ctx, _) {
          final watch = ctx.watch<SingUpController>();
          final read = ctx.read<SingUpController>();
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                key: ctx.watch<SingUpController>().formkey,
                child: ListView(
                  children: <Widget>[
                    30.hSizedBox,
                    TextFormField(
                      controller: watch.nameController,
                      validator: read.nameValidator,
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.people_alt_outlined,
                          color: Color.fromARGB(255, 1, 124, 106),
                        ),
                        labelText: 'Name',
                        labelStyle: TextStyle(
                            fontSize: 25,
                            color: Color.fromARGB(255, 104, 101, 101)),
                        hintText: 'Enter your Name',
                        hintStyle: TextStyle(fontSize: 20),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    40.hSizedBox,
                    TextFormField(
                      controller: watch.emailController,
                      validator: read.emailValidator,
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
                        labelText: 'E-mail',
                        labelStyle: TextStyle(
                          fontSize: 25,
                          color: Color.fromARGB(
                            255,
                            104,
                            101,
                            101,
                          ),
                        ),
                        hintText: 'forexample@yahoo.com',
                        hintStyle: TextStyle(fontSize: 20),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    30.hSizedBox,
                    TextFormField(
                      controller: watch.numberController,
                      validator: read.numberValidator,
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.phone,
                          color: Color.fromARGB(
                            255,
                            1,
                            124,
                            106,
                          ),
                        ),
                        labelText: 'Phone Number',
                        labelStyle: TextStyle(
                          fontSize: 25,
                          color: Color.fromARGB(
                            255,
                            104,
                            101,
                            101,
                          ),
                        ),
                        hintText: 'enter your phone',
                        hintStyle: TextStyle(fontSize: 20),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: watch.governorateController,
                      validator: read.govValidator,
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.credit_card_sharp,
                          color: Color.fromARGB(
                            255,
                            1,
                            124,
                            106,
                          ),
                        ),
                        labelText: 'Governorate ID',
                        labelStyle: TextStyle(
                          fontSize: 25,
                          color: Color.fromARGB(
                            255,
                            104,
                            101,
                            101,
                          ),
                        ),
                        hintText: 'Enter your ID',
                        hintStyle: TextStyle(fontSize: 20),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    StatefulBuilder(builder: (context, changeState) {
                      return TextFormField(
                        controller: watch.passwordController,
                        validator: read.passwordValidator,
                        decoration: InputDecoration(
                          icon: const Icon(
                            Icons.vpn_key_rounded,
                            color: Color.fromARGB(255, 1, 124, 106),
                          ),
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
                          hintStyle: const TextStyle(
                            fontSize: 25,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              changeState(
                                () {
                                  isPasswordVisible = !isPasswordVisible;
                                },
                              );
                            },
                            icon: Icon(
                              isPasswordVisible
                                  ? Icons.visibility_off_rounded
                                  : Icons.visibility,
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: isPasswordVisible,
                      );
                    }),
                    20.hSizedBox,
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          read.formkey.currentState!.validate();
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                        child: const Text(
                          "Sign Up",
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
                    10.hSizedBox,
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(
                          MyRouter.loginPage,
                        );
                      },
                      child: const Text(
                        'Do you have an account Already?',
                        style: TextStyle(color: Colors.black54, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
