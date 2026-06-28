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
  static const Color educationHat = Color(0xFFF46868);
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
      Theme.of(context).brightness == Brightness.dark ? cardBgDark : white;

  static Color getDescriptionText(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? grey400 : grey700;

  static Color getDividerColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? grey800 : grey300;

  static Color getSubtitleText(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? grey400 : grey600;

  static Color getGridDivider(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? grey800 : grey200;

  static Color getTitleText(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? white : black;

  // Sparkles and decorative colors
  static const Color sparklePink = Color(0xFFFF3E81);
  static const Color sparklePurple = Color(0xFF6F52F6);

  // Tech I Use card background colors
  static const Color techCardBgDark = Color(0xFF1A2035);
  static Color getTechCardBg(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? techCardBgDark : white;

  // Mockup volume/power buttons colors
  static const Color mockupButtonDark = Color(0xDD000000);
  static const Color mockupButtonLight = Color(0xFF424242);
  static Color getMockupButton(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? mockupButtonDark
          : mockupButtonLight;

  // Mockup Device frame colors
  static const Color mockupDeviceBgDark = Color(0xFF101018);
  static Color getMockupDeviceBg(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? mockupDeviceBgDark
          : white;

  static const Color mockupDeviceBorderDark = Color(0x3DFFFFFF);
  static const Color mockupDeviceBorderLight = Color(0xDD000000);
  static Color getMockupDeviceBorder(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? mockupDeviceBorderDark
          : mockupDeviceBorderLight;

  // Thought Bubble colors
  static const Color bubbleBgDark = Color(0xFF2E2E3A);
  static Color getBubbleBg(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? bubbleBgDark : white;

  static const Color bubbleBorderDark = Color(0x4DFFFFFF);
  static const Color bubbleBorderLight = Color(0xDD000000);
  static Color getBubbleBorder(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? bubbleBorderDark
          : bubbleBorderLight;

  // Brand colors for Tech I Use section
  static const Color brandFlutter = Color(0xFF02569B);
  static const Color brandDart = Color(0xFF0175C2);
  static const Color brandCpp = Color(0xFF00599C);
  static const Color brandC = Color(0xFFA8B9CC);
  static const Color brandHtml = Color(0xFFE34F26);
  static const Color brandCss = Color(0xFF1572B6);
  static const Color brandJavascript = Color(0xFFF7DF1E);
  static const Color brandReact = Color(0xFF61DAFB);
  static const Color brandPython = Color(0xFF3776AB);
  static const Color brandMysql = Color(0xFF4479A1);
  static const Color brandFirebase = Color(0xFFFFCA28);
  static const Color brandGcp = Color(0xFF4285F4);
  static const Color brandArduino = Color(0xFF00979D);
  static const Color brandGithub = Color(0xFF181717);
  static const Color brandGit = Color(0xFFF05032);
  static const Color brandBitbucket = Color(0xFF0052CC);
  static const Color brandDbeaver = Color(0xFF382923);
  static const Color figma = Color(0xFFF24E1E);
  static const Color brandVsCode = Color(0xFF007ACC);
  static const Color brandAndroidStudio = Color(0xFF3DDC84);
  static const Color brandXcode = Color(0xFF0B4A8C);
  static const Color brandAntigravity = Color(0xFF1A73E8);
  static const Color brandCodex = Color(0xFF10A37F);
  static const Color brandConfluence = Color(0xFF0052CC);
  static const Color brandJira = Color(0xFF0052CC);
  static const Color brandPopOs = Color(0xFFDF80FF);
  static const Color brandMacOs = Color(0xFF0066CC);

  static const Color brandMail = Color(0xFF005FF9);
  static const Color brandlinkedIn = Color(0xFF0A66C2);
  static const Color brandpinterest = Color(0xFFE60023);
}
