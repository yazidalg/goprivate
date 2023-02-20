import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class AuthController extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Rx<TextEditingController> usernameField = TextEditingController().obs;
  Rx<TextEditingController> emailField = TextEditingController().obs;
  Rx<TextEditingController> phoneField = TextEditingController().obs;
  Rx<TextEditingController> passwordField = TextEditingController().obs;
  Rx<TextEditingController> confirmPasswordField = TextEditingController().obs;
  RxList<String> educations = <String>['SD', 'SMP', 'SMA'].obs;

  registerUser() async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: emailField.value.text,
        password: passwordField.value.text,
      );
    } on FirebaseAuthException catch (authException) {
      Get.snackbar("Error", authException.message!);
      throw Exception(authException.message);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  loginUser() async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: emailField.value.text,
        password: passwordField.value.text,
      );
    } on FirebaseAuthException catch (authException) {
      Get.snackbar("Error", authException.message!);
      throw Exception(authException.message);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
