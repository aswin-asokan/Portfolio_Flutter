import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  textTheme: TextTheme(
    titleLarge: GoogleFonts.balsamiqSans(
      fontSize: AppConstants.fontDisplayXXL,
    ),
    titleMedium: GoogleFonts.balsamiqSans(
      fontSize: AppConstants.fontDisplayM,
    ),
    titleSmall: GoogleFonts.balsamiqSans(
      fontSize: AppConstants.fontXL,
    ),
    bodyLarge: GoogleFonts.balsamiqSans(
      fontSize: AppConstants.fontDisplayL,
    ),
    bodyMedium: GoogleFonts.balsamiqSans(
      fontSize: AppConstants.fontL,
    ),
    bodySmall: GoogleFonts.balsamiqSans(
      fontSize: AppConstants.fontM,
    ),
    labelLarge: GoogleFonts.balsamiqSans(
      fontSize: AppConstants.fontDisplayL,
    ),
    labelMedium: GoogleFonts.balsamiqSans(
      fontSize: AppConstants.fontXL,
    ),
    labelSmall: GoogleFonts.balsamiqSans(
      fontSize: AppConstants.fontL,
    ),
    displayMedium: GoogleFonts.balsamiqSans(
      fontSize: AppConstants.fontM,
    ),
    displaySmall: GoogleFonts.balsamiqSans(
      fontSize: AppConstants.fontS,
    ),
    headlineMedium: GoogleFonts.balsamiqSans(
      fontSize: AppConstants.fontDisplayS,
    ),
    headlineSmall: GoogleFonts.balsamiqSans(
      fontSize: AppConstants.fontSM,
    ),
  ),
);
