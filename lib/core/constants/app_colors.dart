import 'package:flutter/material.dart';

class AppColors {
  // Brand colors
  static const Color primaryPurple = Color(0xFF6F52F6);
  static const Color primaryPurpleDark = Color(0xFF9F88FF);

  // Mint/Green (About Me container background)
  static const Color mintBgLight = Color(0xFFEBF7EE);
  static const Color mintBgDark = Color(0xFF0A2316);

  // Lavender/Violet (Art & Crafts container background)
  static const Color lavenderBgLight = Color(0xFFF1EFFF);
  static const Color lavenderBgDark = Color(0xFF1B1633);

  // Highlight badge ("OH HEY!")
  static const Color ohHeyBgLight = Color(0xFFFFEAEF);
  static const Color ohHeyBgDark = Color(0xFF3D1B22);
  static const Color ohHeyTextLight = Color(0xFFE91E63);
  static const Color ohHeyTextDark = Color(0xFFFF85A7);

  // Buy me a coffee button
  static const Color coffeeBg = Color(0xFFFDD835);
  static const Color coffeeText = Color(0xFF1A1A1A);

  // Borders for cards/containers
  static const Color borderLight = Color(0xFFE5E7EB);
  static const Color borderDark = Color(0xFF2E354F);

  static const Color lightGreen = Color(0xFFD7EDDC);
  static const Color darkGreen = Color(0xFF8BC19D);

  static const Color darkButton = Color(0xFF1A1A1A);
  static const Color lightButton = Color(0xFFFFFFFF);

  static const Color scaffoldDarkColor = Color(0xFF090D1A);
  static const Color scaffoldLightColor = Color(0xFFFBFBFC);
  // Theme-aware helpers
  static Color getMintBg(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? mintBgDark
          : mintBgLight;

  static Color getLavenderBg(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? lavenderBgDark
          : lavenderBgLight;

  static Color getOhHeyBg(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? ohHeyBgDark
          : ohHeyBgLight;

  static Color getOhHeyText(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? ohHeyTextDark
          : ohHeyTextLight;

  static Color getBorder(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? borderDark
          : borderLight;
}
