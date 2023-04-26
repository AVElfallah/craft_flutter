import 'package:flutter/material.dart';
import 'package:hyah_karima/controller/reset_password_controller.dart';
import 'package:hyah_karima/router/app_router.dart';
import 'package:provider/provider.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ResetPasswordController>(
      create: (context) => ResetPasswordController(),
      builder: (ctx, _) {
        var watch = ctx.watch<ResetPasswordController>();
        var read = ctx.read<ResetPasswordController>();
        return Scaffold(
          appBar: AppBar(
            title: const Text('Reset your Password'),
            centerTitle: true,
            backgroundColor: Colors.white,
            foregroundColor: Colors.teal.shade900,
            toolbarHeight: 80,
            elevation: 0,
          ),
          body: !watch.isLoading
              ? ListView(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          'Enter your email address and we will send you a pincode to reset your password.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Form(
                        key: watch.formKey,
                        child: TextFormField(
                          controller: watch.emailController,
                          validator: read.emailValidator,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.teal.shade900,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.teal.shade900,
                              ),
                            ),
                            focusColor: Colors.teal.shade900,
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              color: Colors.teal.shade900,
                            ),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.teal.shade900,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          read.forgotPassword(ctx);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal.shade900,
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        icon: const Icon(Icons.send),
                        label: const Text('Send Pincode'),
                      ),
                    )
                  ],
                )
              : Container(
                  color: Colors.black38,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  ),
                ),
        );
      },
    );
  }
}
