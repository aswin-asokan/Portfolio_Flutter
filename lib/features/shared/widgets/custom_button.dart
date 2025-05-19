import 'package:flutter/material.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.onPress,
    this.colorSide = Colors.transparent,
    this.colorBG = const Color(0xfff8781f),
    this.textColor = Colors.white,
  });
  final VoidCallback onPress;
  final String label;
  final Color colorBG;
  final Color colorSide;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: onPress,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(colorBG),
          elevation: WidgetStatePropertyAll(0),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(color: colorSide),
            ),
          ),
        ),
        child: Text(
          label,
          style: context.textTheme.labelMedium!.copyWith(color: textColor),
        ),
      ),
    );
  }
}
