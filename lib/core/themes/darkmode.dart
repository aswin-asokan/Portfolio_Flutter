import 'package:flutter/material.dart';

import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/core/constants/app_constants.dart';

ThemeData darkmode = ThemeData(
  scaffoldBackgroundColor: const Color(0xFF090D1A),
  cardTheme: CardThemeData(
    color: const Color(0xFF111726),
    elevation: 0,
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppConstants.radiusXL),
      side: const BorderSide(color: AppColors.borderDark, width: 1.5),
    ),
  ),
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFF9F88FF),
    onPrimary: Colors.white,
    secondary: Color(0xFF1B1633),
    surface: Color(0xFF111726),
    onSurface: Color(0xFFE5E7EB),
    surfaceBright: Color(0xFF1A2035),
    surfaceContainer: Color(0xFF111726),
    surfaceContainerHigh: Color(0xFF1A2035),
    outline: AppColors.greenBorderDark,
    primaryContainer: AppColors.greenSplashDark,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontFamily: 'BalsamiqSans',
      fontSize: AppConstants.fontDisplayXXL,
    ),
    titleMedium: TextStyle(
      fontFamily: 'BalsamiqSans',
      fontSize: AppConstants.fontDisplayM,
    ),
    titleSmall: TextStyle(
      fontFamily: 'BalsamiqSans',
      fontSize: AppConstants.fontXL,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'BalsamiqSans',
      fontSize: AppConstants.fontDisplayL,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'BalsamiqSans',
      fontSize: AppConstants.fontL,
    ),
    bodySmall: TextStyle(
      fontFamily: 'BalsamiqSans',
      fontSize: AppConstants.fontM,
    ),
    labelLarge: TextStyle(
      fontFamily: 'BalsamiqSans',
      fontSize: AppConstants.fontDisplayL,
    ),
    labelMedium: TextStyle(
      fontFamily: 'BalsamiqSans',
      fontSize: AppConstants.fontXL,
    ),
    labelSmall: TextStyle(
      fontFamily: 'BalsamiqSans',
      fontSize: AppConstants.fontL,
    ),
    displayMedium: TextStyle(
      fontFamily: 'BalsamiqSans',
      fontSize: AppConstants.fontM,
    ),
    displaySmall: TextStyle(
      fontFamily: 'BalsamiqSans',
      fontSize: AppConstants.fontS,
    ),
    headlineMedium: TextStyle(
      fontFamily: 'BalsamiqSans',
      fontSize: AppConstants.fontDisplayS,
    ),
    headlineSmall: TextStyle(
      fontFamily: 'BalsamiqSans',
      fontSize: AppConstants.fontSM,
    ),
  ),
);
