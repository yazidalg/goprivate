import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_private/src/components/text_field_component.dart';
import 'package:go_private/src/controllers/auth_controller.dart';
import 'package:go_private/src/views/register/register_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    return Scaffold(
      backgroundColor: const Color(0xffFCFEFF),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: Center(
          child: Text(
            "Go Private",
            style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(
          left: 25,
          right: 25,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const Text(
                "Selamat Datang",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const Text(
                "Login ke akun anda",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 40),
              TextFieldComponent(
                controller: controller.emailField.value,
                inputType: TextInputType.emailAddress,
                isVisible: false,
                icon: Icons.email,
                hintText: 'Email',
              ),
              const SizedBox(height: 17),
              TextFieldComponent(
                controller: controller.confirmPasswordField.value,
                inputType: TextInputType.text,
                icon: Icons.lock,
                isVisible: true,
                hintText: 'Password',
              ),
              const SizedBox(height: 70),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(
                    Color(0xff00AA13),
                  ),
                  minimumSize: const MaterialStatePropertyAll(
                    Size(double.infinity, 40),
                  ),
                  elevation: const MaterialStatePropertyAll(0),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                onPressed: () async {
                  await controller.loginUser();
                },
                child: const Text(
                  "Login",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 1,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10),
        height: 100,
        alignment: Alignment.center,
        child: RichText(
          text: TextSpan(
              text: "Tidak Punya Akun? ",
              style: const TextStyle(
                color: Color(0xff494949),
              ),
              children: [
                TextSpan(
                  text: " Buat Akun",
                  style: const TextStyle(
                    color: Color(0xffFDB448),
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Get.off(
                          const RegisterView(),
                        ),
                ),
              ]),
        ),
      ),
    );
  }
}
