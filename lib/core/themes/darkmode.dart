import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkmode = ThemeData(
  colorScheme: ColorScheme.light(
    primary: Color(0xfff8781f), // Keep primary color for brand consistency
    onPrimary: Colors.black, // Good contrast on bright primary in dark mode
    secondary: Color(
      0xff3b2e22,
    ), // A deep brownish tone complementing the original secondary
    surface: Color(0xff272121), // Standard dark surface color
    onSurface: Colors.white70,
    surfaceBright: Color(0xff393E46),
    surfaceContainer: Color(0xfffeecd5),
    surfaceContainerHigh: Colors.white,
  ),
  textTheme: TextTheme(
    titleLarge: GoogleFonts.outfit(
      fontSize: 100,
      color: Colors.white38,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: GoogleFonts.outfit(
      fontSize: 35,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    titleSmall: GoogleFonts.outfit(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Colors.white70,
    ),
    bodyLarge: GoogleFonts.outfit(
      fontSize: 40,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    bodyMedium: GoogleFonts.outfit(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodySmall: GoogleFonts.outfit(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.white70,
    ),
    labelLarge: GoogleFonts.outfit(
      fontSize: 40,
      fontWeight: FontWeight.w500,
      color: Colors.white70,
    ),
    labelMedium: GoogleFonts.outfit(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Color(0xfff8781f),
    ),
    labelSmall: GoogleFonts.outfit(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: Colors.white70,
    ),
    displayMedium: GoogleFonts.outfit(
      fontSize: 16,
      fontWeight: FontWeight.w300,
      color: Colors.white,
    ),
    displaySmall: GoogleFonts.outfit(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.white54,
    ),
    headlineMedium: GoogleFonts.outfit(
      fontSize: 30,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
  ),
);
