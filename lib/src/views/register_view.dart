import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_private/src/controllers/auth_controller.dart';
import 'package:go_private/src/views/login_view.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "GoPrivate.",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(controller: controller.emailField.value),
            TextField(controller: controller.passwordField.value),
            TextField(controller: controller.confirmPasswordField.value),
            ElevatedButton(
              onPressed: () async {
                await controller.registerUser();
              },
              child: Text("Register"),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(10),
        child: RichText(
          text: TextSpan(
              text: "Sudah Punya Akun?",
              style: const TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: "Login",
                  style: const TextStyle(color: Color(0xFFFDB448)),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Get.off(
                          const LoginView(),
                        ),
                ),
              ]),
        ),
      ),
    );
  }
}
