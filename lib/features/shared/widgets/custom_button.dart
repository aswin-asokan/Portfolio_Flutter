import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';

enum CustomButtonVariant { primary, outline, text, filled }

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.onPress,
    this.prefixIcon,
    this.suffixIcon,
    this.colorBG,
    this.colorSide,
    this.textColor,
    this.variant = CustomButtonVariant.primary,
  });

  // Named constructors for convenience variants
  const CustomButton.primary({
    super.key,
    required this.label,
    required this.onPress,
    this.prefixIcon,
    this.suffixIcon,
    this.colorBG,
    this.textColor,
  }) : colorSide = Colors.transparent,
       variant = CustomButtonVariant.primary;

  const CustomButton.outline({
    super.key,
    required this.label,
    required this.onPress,
    this.prefixIcon,
    this.suffixIcon,
    this.colorSide,
    this.textColor,
  }) : colorBG = Colors.transparent,
       variant = CustomButtonVariant.outline;

  const CustomButton.text({
    super.key,
    required this.label,
    required this.onPress,
    this.prefixIcon,
    this.suffixIcon,
    this.textColor,
  }) : colorBG = Colors.transparent,
       colorSide = Colors.transparent,
       variant = CustomButtonVariant.text;

  const CustomButton.filled({
    super.key,
    required this.label,
    required this.onPress,
    required Color color,
    this.prefixIcon,
    this.suffixIcon,
    this.textColor,
  }) : colorBG = color,
       colorSide = Colors.transparent,
       variant = CustomButtonVariant.filled;

  final VoidCallback onPress;
  final String label;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? colorBG;
  final Color? colorSide;
  final Color? textColor;
  final CustomButtonVariant variant;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Color resolvedBG;
    Color resolvedSide;
    Color resolvedText;

    switch (variant) {
      case CustomButtonVariant.primary:
        resolvedBG = colorBG ?? theme.colorScheme.primary;
        resolvedSide = colorSide ?? Colors.transparent;
        resolvedText = textColor ?? theme.colorScheme.onPrimary;
        break;
      case CustomButtonVariant.outline:
        resolvedBG = colorBG ?? Colors.transparent;
        resolvedSide = colorSide ?? theme.colorScheme.primary;
        resolvedText = textColor ?? theme.colorScheme.primary;
        break;
      case CustomButtonVariant.text:
        resolvedBG = colorBG ?? Colors.transparent;
        resolvedSide = colorSide ?? Colors.transparent;
        resolvedText = textColor ?? theme.colorScheme.primary;
        break;
      case CustomButtonVariant.filled:
        resolvedBG = colorBG ?? theme.colorScheme.primary;
        resolvedSide = colorSide ?? Colors.transparent;
        resolvedText =
            textColor ??
            (ThemeData.estimateBrightnessForColor(resolvedBG) == Brightness.dark
                ? Colors.white
                : Colors.black87);
        break;
    }

    final textWidget = Text(
      label,
      style: context.textTheme.bodySmall?.copyWith(color: resolvedText),
    );

    Widget content;
    if (prefixIcon != null || suffixIcon != null) {
      content = Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 8,
        children: [
          if (prefixIcon != null) prefixIcon!,
          textWidget,
          if (suffixIcon != null) suffixIcon!,
        ],
      );
    } else {
      content = textWidget;
    }

    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: resolvedBG,
          foregroundColor: resolvedText,
          elevation: 0,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.spaceL,
            vertical: AppConstants.spaceM,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side:
                resolvedSide != Colors.transparent
                    ? BorderSide(color: resolvedSide, width: 1.5)
                    : BorderSide.none,
          ),
        ).copyWith(elevation: const WidgetStatePropertyAll(0)),
        child: content,
      ),
    );
  }
}
