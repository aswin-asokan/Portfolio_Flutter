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

  static Color aboutAppColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? lightGreen : darkGreen;
  static Color aboutProjectColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? lavenderBadgeBgLight
          : lavenderBorderDark;

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
  static const Color brandGithubAlt = Color(0xFF4183C4);
  static const Color brandJava = Color(0xFFE76F00);
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

  // AniList Section Colors
  static const Color anilistBgLight = Color(0xFF2B2D42);
  static const Color anilistBgDark = Color(0xFF152232);
  static const Color anilistBorderLight = Color(0x403F4E75);
  static const Color anilistBorderDark = Color(0x4D2E354F);
  static const Color anilistBtnText = Color(0xFF0F172A);
  static const Color anilistDeviceBgDark = Color(0xFF101018);
  static const Color anilistDeviceBgLight = Color(0xFF0F172A);
  static const Color anilistDeviceBorderDark = Color(0x3DFFFFFF);
  static const Color anilistDeviceBorderLight = Color(0x7FFFFFFF);

  static Color getAnilistBg(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? anilistBgDark
          : anilistBgLight;
  static Color getAnilistBorder(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? anilistBorderDark
          : anilistBorderLight;
  static Color getAnilistDeviceBg(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? anilistDeviceBgDark
          : anilistDeviceBgLight;
  static Color getAnilistDeviceBorder(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? anilistDeviceBorderDark
          : anilistDeviceBorderLight;

  // Shimmer & Loading Bar Colors
  static const Color shimmerBaseLight = Color(0xFFE0E0E0);
  static const Color shimmerBaseDark = Color(0xFF2E2E2E);
  static const Color shimmerHighlightLight = Color(0xFFF5F5F5);
  static const Color shimmerHighlightDark = Color(0xFF3D3D3D);
  static const Color loadingBarStripe1 = Color(0xFF7B61FF);
  static const Color loadingBarStripe2 = Color(0xFF8B6DFF);

  static Color getShimmerBase(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? shimmerBaseDark
          : shimmerBaseLight;
  static Color getShimmerHighlight(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? shimmerHighlightDark
          : shimmerHighlightLight;

  // Theme Switch Indicator Colors
  static const Color themeSwitchBgDark = Color(0xFF120B2B);
  static const Color themeSwitchBgLight = Color(0xFFFFF5D9);
  static const Color themeSwitchBorder = Color(0xFFD2B9FF);
  static const Color themeSwitchPurple = Color(0xFFA86CFF);
  static const Color themeSwitchYellow = Color(0xFFF8BE2C);

  // Specific Brand / Tech Colors
  static const Color brandGemini = Color(0xFF8E75FF);
  static const Color brandSqlite = Color(0xFF003B57);

  // Experience Timeline Dots Colors
  static const Color expDotGreen = Color(0xFF66BB6A);
  static const Color expDotOrange = Color(0xFFFFB74D);
  static const Color expDotPink = Color(0xFFF48FB1);
  static const Color expDotBlue = Color(0xFF4FC3F7);

  // Project Themes & Badges (Lavender, Mint, Orange, Pink)
  static const Color lavenderBorderLight = Color(0xFFDCD8FF);
  static const Color lavenderBorderDark = Color(0xFF382E66);
  static const Color lavenderTextLight = Color(0xFF5E35B1);
  static const Color lavenderTextDark = Color(0xFFE1D3FF);
  static const Color lavenderBadgeBgLight = Color(0xFFE8E4FF);
  static const Color lavenderBadgeBgDark = Color(0xFF2C244C);
  static const Color lavenderBadgeTextLight = Color(0xFF6F52F6);
  static const Color lavenderBadgeTextDark = Color(0xFFB39DFF);

  static const Color mintBorderLight = Color(0xFFCEEBDC);
  static const Color mintBorderDark = Color(0xFF1E3A2F);
  static const Color mintTextLight = Color(0xFF2E7D32);
  static const Color mintTextDark = Color(0xFFA3E2C9);
  static const Color mintBadgeBgLight = Color(0xFFE8F5E9);
  static const Color mintBadgeBgDark = Color(0xFF133221);
  static const Color mintBadgeTextLight = Color(0xFF2E7D32);
  static const Color mintBadgeTextDark = Color(0xFF81C784);

  static const Color orangeBgLight = Color(0xFFFFF3E0);
  static const Color orangeBgDark = Color(0xFF2E1C0A);
  static const Color orangeBorderLight = Color(0xFFFFE0B2);
  static const Color orangeBorderDark = Color(0xFF4E3629);
  static const Color orangeTextLight = Color(0xFFEF6C00);
  static const Color orangeTextDark = Color(0xFFFFCC80);
  static const Color orangeBadgeBgLight = Color(0xFFFFF3E0);
  static const Color orangeBadgeBgDark = Color(0xFF3E2712);
  static const Color orangeBadgeTextLight = Color(0xFFEF6C00);
  static const Color orangeBadgeTextDark = Color(0xFFFFB74D);

  static const Color pinkBgLight = Color(0xFFFFEBEE);
  static const Color pinkBgDark = Color(0xFF33161C);
  static const Color pinkBorderLight = Color(0xFFFFCDD2);
  static const Color pinkBorderDark = Color(0xFF5C2932);
  static const Color pinkTextLight = Color(0xFFC2185B);
  static const Color pinkTextDark = Color(0xFFFFCCD5);
  static const Color pinkBadgeBgLight = Color(0xFFFFEBEE);
  static const Color pinkBadgeBgDark = Color(0xFF4A1F26);
  static const Color pinkBadgeTextLight = Color(0xFFC2185B);
  static const Color pinkBadgeTextDark = Color(0xFFFF8A80);

  // Filter Chips Selected Colors
  static const Color filterBlueLight = Color(0xFF0288D1);
  static const Color filterBlueDark = Color(0xFF4FC3F7);
  static const Color filterBlueBgLight = Color(0xFFE3F2FD);
  static const Color filterBlueBgDark = Color(0xFF0A304E);

  static const Color filterTealLight = Color(0xFF00796B);
  static const Color filterTealDark = Color(0xFF4DB6AC);
  static const Color filterTealBgLight = Color(0xFFE0F2F1);
  static const Color filterTealBgDark = Color(0xFF0A3C36);

  static const Color filterOrangeLight = Color(0xFFF57C00);
  static const Color filterOrangeDark = Color(0xFFFFB74D);
  static const Color filterOrangeBgLight = Color(0xFFFFF3E0);
  static const Color filterOrangeBgDark = Color(0xFF4E2A0A);

  static const Color filterAiLight = Color(0xFF7B1FA2);
  static const Color filterAiDark = Color(0xFFBA68C8);
  static const Color filterAiBgLight = Color(0xFFF3E5F5);
  static const Color filterAiBgDark = Color(0xFF3F134A);

  static const Color filterGreyLight = Color(0xFF455A64);
  static const Color filterGreyDark = Color(0xFFB0BEC5);
  static const Color filterGreyBgLight = Color(0xFFECEFF1);
  static const Color filterGreyBgDark = Color(0xFF2C3539);

  static const Color textGrey = Color(0xFF888888);
  static const Color textDarkGrey = Color(0xFF1F2937);

  static Color getLavenderBorder(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? lavenderBorderDark
          : lavenderBorderLight;
  static Color getOrangeBg(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? orangeBgDark
          : orangeBgLight;
  static Color getOrangeBorder(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? orangeBorderDark
          : orangeBorderLight;
  static Color getPinkBg(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? pinkBgDark
          : pinkBgLight;
  static Color getPinkBorder(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? pinkBorderDark
          : pinkBorderLight;
  static Color getBlackBorder(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light ? black : white;
}
