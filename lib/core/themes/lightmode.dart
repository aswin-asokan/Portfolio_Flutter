import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightmode = ThemeData(
  colorScheme: ColorScheme.light(
    primary: Color(0xfff8781f),
    onPrimary: Colors.white,
    secondary: Color(0xfffef6ed),
    surface: Colors.white,
    onSurface: Colors.black87,
    surfaceBright: Color(0xfffef7f3),
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
      fontWeight: FontWeight.w500,
      color: Colors.black87,
    ),
    titleSmall: GoogleFonts.outfit(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Colors.black45,
    ),
    bodyLarge: GoogleFonts.outfit(
      fontSize: 40,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    bodyMedium: GoogleFonts.outfit(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    bodySmall: GoogleFonts.outfit(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.black54,
    ),
    labelLarge: GoogleFonts.outfit(
      fontSize: 40,
      fontWeight: FontWeight.w500,
      color: Colors.black87,
    ),
    labelMedium: GoogleFonts.outfit(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Color(0xfff8781f),
    ),
    labelSmall: GoogleFonts.outfit(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: Colors.black54,
    ),
    displayMedium: GoogleFonts.outfit(
      fontSize: 16,
      fontWeight: FontWeight.w300,
      color: Colors.white,
    ),
    displaySmall: GoogleFonts.outfit(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.black45,
    ),
    headlineMedium: GoogleFonts.outfit(
      fontSize: 30,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    headlineSmall: GoogleFonts.outfit(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
  ),
);
