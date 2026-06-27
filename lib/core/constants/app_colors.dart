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

  // Green border and splash colors for About section
  static const Color greenBorderLight = Color(0xFFCEEBDC);
  static const Color greenSplashLight = Color(0xFFE6F5EC);
  static const Color greenBorderDark = Color(0xFF1E3A2F);
  static const Color greenSplashDark = Color(0xFF10261C);

  static Color getGreenBorder(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? greenBorderDark
          : greenBorderLight;

  static Color getGreenSplash(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? greenSplashDark
          : greenSplashLight;

  // Constant grays and basic colors to avoid runtime Material Color swatch lookup
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color grey200 = Color(0xFFEEEEEE);
  static const Color grey300 = Color(0xFFE0E0E0);
  static const Color grey400 = Color(0xFFBDBDBD);
  static const Color grey600 = Color(0xFF757575);
  static const Color grey700 = Color(0xFF616161);
  static const Color grey800 = Color(0xFF424242);

  // Card theme-aware colors
  static const Color cardBgDark = Color(0xFF0D1321);

  static Color getCardBg(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? cardBgDark
          : white;

  static Color getDescriptionText(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? grey400
          : grey700;

  static Color getDividerColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? grey800
          : grey300;

  static Color getSubtitleText(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? grey400
          : grey600;

  static Color getGridDivider(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? grey800
          : grey200;

  static Color getTitleText(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? white
          : black;

  // Sparkles and decorative colors
  static const Color sparklePink = Color(0xFFFF3E81);
  static const Color sparklePurple = Color(0xFF6F52F6);
}
