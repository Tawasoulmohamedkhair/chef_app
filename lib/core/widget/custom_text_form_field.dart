import 'package:chef_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.controller,
      this.validator,
      this.label,
      required this.hint,
      this.obscureText = false,
      this.icon,
      this.suffixIconOnPressed});
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? label;
  final String hint;
  final bool obscureText;
  final IconData? icon;
  final VoidCallback? suffixIconOnPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
          label: Text(label ?? ''),
          hintText: hint,
          suffixIcon: IconButton(
              onPressed: suffixIconOnPressed,
              icon: Icon(color: AppColors.primary, icon))),
    );
  }
}
