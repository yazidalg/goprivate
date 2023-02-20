import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_private/src/components/text_field_component.dart';
import 'package:go_private/src/controllers/auth_controller.dart';

import '../login_view.dart';

class RegisterStudentView extends StatelessWidget {
  const RegisterStudentView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(110),
        child: Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 20),
          child: const Text(
            "Go Private",
            style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.only(left: 25, right: 25),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            const Text(
              "Buat Akun Baru Sebagai Murid",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Text(
              "Nikmati Beragam Fitur Go Private",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            TextFieldComponent(
              controller: controller.usernameField.value,
              icon: Icons.person,
              inputType: TextInputType.name,
              isVisible: false,
              hintText: 'Nama Lengkap',
            ),
            const SizedBox(height: 15),
            TextFieldComponent(
              controller: controller.emailField.value,
              icon: Icons.email,
              inputType: TextInputType.emailAddress,
              isVisible: false,
              hintText: 'Email',
            ),
            const SizedBox(height: 15),
            TextFieldComponent(
              controller: controller.phoneField.value,
              icon: Icons.phone,
              inputType: TextInputType.phone,
              isVisible: false,
              hintText: 'Nomor Telepon',
            ),
            const SizedBox(height: 15),
            DropdownButtonFormField(
              dropdownColor: const Color(0xffDADCDC),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.black.withOpacity(0.15),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.black.withOpacity(0.15),
                  ),
                ),
                contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                prefixIcon: const Icon(
                  Icons.school,
                  color: Color(0xffDADCDC),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              value: controller.educations.first,
              items: controller.educations
                  .map<DropdownMenuItem<String>>(
                    (element) => DropdownMenuItem(
                      value: element,
                      child: Text(element),
                    ),
                  )
                  .toList(),
              onChanged: (data) {},
            ),
            const SizedBox(height: 15),
            TextFieldComponent(
              controller: controller.passwordField.value,
              icon: Icons.lock,
              inputType: TextInputType.name,
              isVisible: false,
              hintText: 'Password',
            ),
            const SizedBox(height: 15),
            TextFieldComponent(
              controller: controller.passwordField.value,
              icon: Icons.lock,
              inputType: TextInputType.name,
              isVisible: false,
              hintText: 'Konfirmasi Password',
            ),
            const SizedBox(height: 15),
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
              onPressed: () => controller.registerUser(),
              child: const Text(
                "Login",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 1,
                ),
              ),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 10),
        height: 18,
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
