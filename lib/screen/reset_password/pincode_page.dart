import 'package:flutter/material.dart';
import 'package:hyah_karima/controller/pincode_page_controller.dart';
import 'package:hyah_karima/widget/pincode_passwordfilde_widget.dart';
import 'package:provider/provider.dart';

import '../../widget/pincode_text_widget.dart';

class PincodePage extends StatelessWidget {
  const PincodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int pincode =
        (ModalRoute.of(context)?.settings.arguments as Map)['pin'];

    return ChangeNotifierProvider<PincodePageController>(
        create: (_) => PincodePageController(),
        builder: (ctx, _) {
          final watch = ctx.watch<PincodePageController>();
          watch.pincode = pincode;
          final read = ctx.read<PincodePageController>();
          return Scaffold(
            backgroundColor: Colors.blueGrey.shade900,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: const Text('Reset your Password'),
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(
                  Icons.output_rounded,
                  size: 36,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            body: !watch.isLoading
                ? Column(
                    children: [
                      Visibility(
                        visible: !watch.isPincodeValid,
                        child: Expanded(
                          child: ListView(
                            children: [
                              const SizedBox(
                                height: 40,
                              ),
                              const Text(
                                "Check your Email \n Insert the pincode here",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Form(
                                key: watch.formKey1,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      PincodeTextWidget(
                                        controller: watch.pin1,
                                        validator: read.pinValidetor,
                                        isTopLevel: true,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      PincodeTextWidget(
                                        controller: watch.pin2,
                                        validator: read.pinValidetor,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      PincodeTextWidget(
                                        controller: watch.pin3,
                                        validator: read.pinValidetor,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      PincodeTextWidget(
                                        controller: watch.pin4,
                                        validator: read.pinValidetor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 80,
                                  vertical: 25,
                                ),
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    read.checkPincode(context);
                                  },
                                  icon: const Icon(
                                    Icons.cloud_sync_rounded,
                                  ),
                                  label: const Text('Check Code'),
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(50, 60),
                                    backgroundColor: Colors.teal.shade900,
                                    textStyle: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: watch.isPincodeValid,
                        child: Expanded(
                          child: ListView(
                            children: [
                              const SizedBox(
                                height: 40,
                              ),
                              const Padding(
                                padding: EdgeInsets.all(15),
                                child: Text(
                                  "Insert your new password",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Form(
                                key: watch.formKey2,
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    children: [
                                      PincodePasswordFiledWidget(
                                        controller: watch.password,
                                        label: "Password",
                                        validator: read.passwordValidator,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      PincodePasswordFiledWidget(
                                        controller: watch.confirmPassword,
                                        label: "Password Confirmation",
                                        validator:
                                            read.confirmPasswordValidator,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 80,
                                  vertical: 25,
                                ),
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    read.formKey2.currentState!.validate();
                                    read.changePasseword(context);
                                  },
                                  icon: const Icon(
                                    Icons.cloud_sync_rounded,
                                  ),
                                  label: const Text('Reset Password'),
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(50, 60),
                                    backgroundColor: Colors.teal.shade900,
                                    textStyle: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                : Container(
                    color: Colors.black38,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
          );
        });
  }
}
