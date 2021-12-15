import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munchkin/controllers/auth_controller.dart';

class SignUp extends GetWidget<AuthController> {
  SignUp({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      resizeToAvoidBottomInset: true,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 80,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 300,
              child: Form(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Email',
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Password',
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8)))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextFormField(
                        controller: confirmPasswordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Confirm Password',
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8)))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (passwordController.text != confirmPasswordController.text) {
                            Get.snackbar(
                              "Error Signing Up",
                              "Passwords dont match",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Theme.of(context).snackBarTheme.backgroundColor,
                              colorText: Theme.of(context).snackBarTheme.contentTextStyle?.color,
                            );
                          } else if (passwordController.text == '') {
                            Get.snackbar(
                              "Password",
                              "Password field is required",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Theme.of(context).snackBarTheme.backgroundColor,
                              colorText: Theme.of(context).snackBarTheme.contentTextStyle?.color,
                            );
                          } else if (confirmPasswordController.text == '') {
                            Get.snackbar(
                              "Confirm Password",
                              "Confirm Password field is required",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Theme.of(context).snackBarTheme.backgroundColor,
                              colorText: Theme.of(context).snackBarTheme.contentTextStyle?.color,
                            );
                          } else {
                            controller.createUser(emailController.text, passwordController.text);
                          }
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 20),
                        ),
                        style: ElevatedButton.styleFrom(fixedSize: const Size(300, 40)),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(fixedSize: const Size(300, 40)),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
