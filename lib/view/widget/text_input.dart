import 'package:basic_mobile_app/core/constant/theme_constants.dart';
import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;

  const CustomTextInput({
    super.key,
    required this.controller,
    required this.labelText,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        // This ensures that when focused the label always floats
        labelText: labelText,
        labelStyle: const TextStyle(color: AppTheme.inputTextColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppTheme.inputBorderRadius),
          borderSide: BorderSide.none,
        ),
        suffixIcon: suffixIcon,
        // Adjust the top padding to ensure the floating label stays within the input
        contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
        fillColor: AppTheme.inputBackgroundColor,
        filled: true,
      ),
      validator: validator,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
    );
  }
}
