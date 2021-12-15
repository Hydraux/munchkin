import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munchkin/controllers/auth_controller.dart';
import 'package:munchkin/views/signup.dart';

class Login extends GetWidget<AuthController> {
  Login({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
              'Login',
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
                      child: ElevatedButton(
                        onPressed: () {
                          controller.login(emailController.text, passwordController.text);
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 20),
                        ),
                        style: ElevatedButton.styleFrom(fixedSize: const Size(300, 40)),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(SignUp());
                      },
                      child: const Text(
                        'Sign up',
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
