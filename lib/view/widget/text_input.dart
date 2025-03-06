import 'package:flutter/material.dart';
import '../../core/theme/color_extension.dart';

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
    // Get colors from theme extension
    final colors = Theme.of(context).extension<AppColorExtension>();

    return Container(
        decoration: BoxDecoration(
            color: colors?.input ?? Theme.of(context).disabledColor,
            borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: labelText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            suffixIcon: suffixIcon,
            isDense: true,
            floatingLabelStyle: const TextStyle(
              fontSize: 14,
            ),
          ),
          validator: validator,
          obscureText: obscureText,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
        ));
  }
}
