import 'package:flutter/material.dart';

class TextFieldComponent extends StatelessWidget {
  const TextFieldComponent({
    super.key,
    required this.controller,
    required this.icon,
    required this.inputType,
    required this.isVisible,
    required this.hintText,
  });

  final TextEditingController controller;
  final IconData icon;
  final TextInputType inputType;
  final bool isVisible;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      obscureText: isVisible,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        filled: true,
        fillColor: const Color.fromRGBO(0, 0, 0, 0.04),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        prefixIcon: Icon(icon),
        prefixIconColor: const Color.fromRGBO(0, 0, 0, 0.10),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color.fromRGBO(0, 0, 0, 0.25),
        ),
      ),
    );
  }
}
