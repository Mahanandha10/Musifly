import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isObscureText;
  const CustomField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isObscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      validator: (val) {
        if (val!.trim().isEmpty) {
          return "$hintText is missing..";
        }
        return null;
      },
      obscureText: isObscureText,
    );
  }
}
