import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/core/constants/app_constants.dart';

ThemeData darkmode = ThemeData(
  scaffoldBackgroundColor: const Color(0xFF090D1A),
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
