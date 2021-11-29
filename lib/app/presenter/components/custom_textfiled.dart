import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controllerEmail;
  final Function(String)? onChanged;
  final IconData icon;
  final String? hintText;
 final bool obscureText;
  final String? labelText;
  final Key? key;

  CustomTextField(
      {required this.controllerEmail,
      required this.icon,
      this.key,
      this.hintText,
      this.onChanged,
      this.obscureText = false,
      this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      controller: controllerEmail,
      onChanged: onChanged,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        suffixIcon: Icon(icon),
      ),
    );
  }
}