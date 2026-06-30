import 'package:flutter/material.dart';

import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/core/constants/app_constants.dart';

ThemeData lightmode = ThemeData(
  scaffoldBackgroundColor: const Color(0xFFFBFBFC),
  cardTheme: CardThemeData(
    color: Colors.white,
    elevation: 0,
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppConstants.radiusXL),
      side: const BorderSide(color: AppColors.borderLight, width: 1.5),
    ),
  ),
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF6F52F6),
    onPrimary: Colors.white,
    secondary: Color(0xFFECE9FF),
    surface: Colors.white,
    onSurface: Color(0xFF1F2937),
    surfaceBright: Color(0xFFF3F4F6),
    surfaceContainer: Color(0xFFE5E7EB),
    surfaceContainerHigh: Colors.white,
    outline: AppColors.greenBorderLight,
    primaryContainer: AppColors.greenSplashLight,
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
