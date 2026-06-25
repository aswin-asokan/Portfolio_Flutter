import 'package:flutter/material.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';

class FooterText extends StatelessWidget {
  const FooterText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: [
        Text(
          "Thanks for Scrolling!",
          style: context.textTheme.headlineMedium,
        ),
        Text(
          "Crafted with care and code.\nLet’s connect and create something awesome together.",
          style: context.textTheme.displayMedium,
        ),
      ],
    );
  }
}
