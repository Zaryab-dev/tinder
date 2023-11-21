import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String hintText;
  TextInputType type;
  TextInputAction action;
  double size;
  IconData iconData;
  TextEditingController controller;
  final bool isObscure;

  CustomTextField({
    super.key,
    required this.iconData,
    required this.action,
    required this.type,
    this.size = 5,
    required this.hintText,
    required this.controller,
    this.isObscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: action,
      keyboardType: type,
      obscureText: isObscure,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        hintText: hintText,
        hintStyle: const TextStyle(fontFamily: 'Round',),
        prefixIcon: Icon(iconData),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
