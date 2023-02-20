import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_private/src/views/login_view.dart';
import 'package:go_private/src/views/register/register_student_view.dart';
import 'package:go_private/src/views/register/register_teacher_view.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.only(
          left: 25,
          right: 25,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const Text(
                "Buat Akun Sebagai?",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const Text(
                "Nikmati beragam fitur Go Private",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => Get.off(const RegisterTeacherView()),
                style: const ButtonStyle(
                  elevation: MaterialStatePropertyAll(0),
                  backgroundColor: MaterialStatePropertyAll(
                    Color(0xff47AEDE),
                  ),
                  minimumSize: MaterialStatePropertyAll(
                    Size(double.infinity, 100),
                  ),
                ),
                child: const Text(
                  "Guru",
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => Get.off(const RegisterStudentView()),
                style: const ButtonStyle(
                  elevation: MaterialStatePropertyAll(0),
                  backgroundColor: MaterialStatePropertyAll(
                    Color.fromRGBO(0, 170, 19, 0.85),
                  ),
                  minimumSize: MaterialStatePropertyAll(
                    Size(double.infinity, 100),
                  ),
                ),
                child: const Text(
                  "Murid",
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
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
              text: "Sudah Punya Akun? ",
              style: const TextStyle(
                color: Color(0xff494949),
              ),
              children: [
                TextSpan(
                  text: " Login",
                  style: const TextStyle(
                    color: Color(0xffFDB448),
                  ),
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
