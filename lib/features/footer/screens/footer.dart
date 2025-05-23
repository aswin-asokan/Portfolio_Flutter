import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:portfolio/features/footer/widgets/footer_icons.dart';
import 'package:portfolio/features/footer/widgets/footer_text.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';
import 'package:portfolio/features/shared/widgets/toast.dart';
import 'package:portfolio/responsive/responsive.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});
  static const List<String> easterEggs = [
    "Built with love… and a little bit of hot reload.",
    "May your widgets always be stateless (unless they really need to be).",
    "No bugs here... just undocumented features!",
    "This isn't the widget you're looking for...",
    "This message is wrapped in a Padding of mystery.",
    "Life’s better with const everywhere.",
    "You just discovered the flutter of a hidden wing.",
    "If you found this, you're 1 in 1,000,000 frames per second!",
  ];
  static var random = Random();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
        child: Container(
          padding: EdgeInsets.all(30),
          width: double.infinity,
          height: Responsive.isMobile(context) ? 420 : 220,
          decoration: BoxDecoration(
            color:
                isDark
                    ? Colors.black26.withAlpha(50)
                    : Colors.white10.withAlpha(50), // semi-transparent color
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  if (Responsive.isMobile(context)) {
                    return Column(
                      spacing: 20,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [FooterText(), FooterIcons()],
                    );
                  } else {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [FooterText(), FooterIcons()],
                    );
                  }
                },
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 8,
                    children: [
                      Icon(
                        Symbols.copyright,
                        color: context.colorScheme.surfaceContainerHigh,
                        size: 20,
                      ),
                      SelectableText(
                        "Aswin, 2025",
                        style: context.textTheme.displayMedium,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SelectableText(
                        "Made with ",
                        style: context.textTheme.displayMedium,
                      ),
                      IconButton(
                        onPressed: () {
                          final randomEgg =
                              easterEggs[random.nextInt(easterEggs.length)];

                          showToast(context, randomEgg);
                        },
                        icon: Icon(
                          Symbols.flutter,
                          color: context.colorScheme.surfaceContainerHigh,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
