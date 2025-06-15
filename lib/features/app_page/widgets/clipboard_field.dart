import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';
import 'package:portfolio/features/shared/widgets/toast.dart';

class ClipboardField extends StatelessWidget {
  const ClipboardField({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: true,
      enableInteractiveSelection: true,
      style: context.textTheme.displaySmall,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(Icons.copy, size: 15),
          onPressed: () {
            Clipboard.setData(ClipboardData(text: controller.text));
            showToast(context, "Link copied to clipboard");
          },
        ),
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
