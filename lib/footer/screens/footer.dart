import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:portfolio/footer/widgets/footer_icon.dart';
import 'package:portfolio/shared/extension/theme_extension.dart';
import 'package:portfolio/shared/widgets/toast.dart';

class Footer extends StatelessWidget {
  const Footer({super.key, required this.isDark});
  final bool isDark;
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
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
        child: Container(
          padding: EdgeInsets.all(30),
          width: double.infinity,
          height: 200,
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
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Thanks for Scrolling!",
                        style: context.textTheme.headlineMedium,
                      ),
                      Row(
                        children: [
                          FooterIcon(path: "assets/icons/github.svg", url: ""),
                          FooterIcon(
                            path: "assets/icons/linkedin.svg",
                            url: "",
                          ),
                          FooterIcon(
                            path: "assets/icons/pinterest.svg",
                            url: "",
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Crafted with care and code.\nLet’s connect and create something awesome together.",
                        style: context.textTheme.displayMedium,
                      ),
                      FooterIcon(
                        path: "assets/icons/Buy_Me_a_Coffee_logo.svg",
                        url: "",
                      ),
                    ],
                  ),
                ],
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
                      Text(
                        "Aswin Asokan, 2025",
                        style: context.textTheme.displayMedium,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
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
