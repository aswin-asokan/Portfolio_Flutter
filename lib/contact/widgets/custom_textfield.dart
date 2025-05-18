import 'package:flutter/material.dart';
import 'package:portfolio/shared/extension/theme_extension.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.maxline,
  });
  final TextEditingController controller;
  final String hintText;
  final int maxline;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: context.textTheme.bodySmall!.copyWith(
        color: context.colorScheme.primary,
      ),
      maxLines: maxline,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: context.textTheme.bodySmall,
        fillColor: context.colorScheme.secondary,
        filled: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 15),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.colorScheme.secondary),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.colorScheme.primary),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
