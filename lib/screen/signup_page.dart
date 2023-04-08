import 'package:flutter/material.dart';
import 'package:hyah_karima/extensions/assestent_extension.dart';
import 'package:hyah_karima/extensions/colors.dart';

import 'package:hyah_karima/router/app_router.dart';
import 'package:provider/provider.dart';
import 'package:hyah_karima/controller/singup_controller.dart';
import '../extensions/governrates.dart';

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
          body: Stack(
            children: [
              Padding(
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
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.phone,
                            color: iconsColor,
                          ),
                          labelText: 'Phone Number',
                          labelStyle: const TextStyle(
                            fontSize: 25,
                            color: Color.fromARGB(
                              255,
                              104,
                              101,
                              101,
                            ),
                          ),
                          hintText: 'enter your phone',
                          hintStyle: const TextStyle(fontSize: 20),
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.map,
                            size: 30,
                            color: iconsColor,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: DropdownButton<int>(
                              menuMaxHeight:
                                  MediaQuery.of(context).size.height * .65,
                              borderRadius: BorderRadius.circular(
                                25,
                              ),
                              value: watch.governrateValue,
                              iconSize: 35,
                              hint: const Text(
                                'Choose your Governorate',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              items: governrateList
                                  .map<DropdownMenuItem<int>>(
                                    (e) => DropdownMenuItem<int>(
                                      value: e.number!,
                                      child: Text(
                                        e.englishName!,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: read.changeGovernrate,
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                        indent: 20,
                        endIndent: 20,
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
                          onPressed: () => read.register(context),
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
              Visibility(
                visible: watch.isLoading,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.black.withOpacity(
                    .35,
                  ),
                  child: const Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.red,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
