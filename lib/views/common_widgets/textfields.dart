import 'package:flutter/material.dart';

class Fields extends StatelessWidget {
  final TextEditingController controllers;
  final String labelText;
  final String hintText;
  final bool obscureText;
  final Widget? icon;
  final FormFieldValidator validator;
  const Fields({
    super.key,
    required this.controllers,
    required this.labelText,
    required this.hintText,
    required this.obscureText,
    this.icon,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllers,
      validator: validator,
      decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          suffix: icon,
          hintStyle: const TextStyle(
              color: Color.fromARGB(255, 150, 149, 149), fontSize: 15),
          labelStyle: const TextStyle(color: Colors.purple)),
      obscureText: obscureText,
    );
  }
}
