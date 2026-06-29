import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:simple_icons/simple_icons.dart';

IconData? getTechIcon(String techName) {
  final name = techName.toLowerCase().trim();
  
  // Brands
  if (name.contains('flutter')) return SimpleIcons.flutter;
  if (name.contains('dart')) return SimpleIcons.dart;
  if (name.contains('firebase')) return SimpleIcons.firebase;
  if (name.contains('gemini')) return SimpleIcons.googlegemini;
  if (name.contains('python')) return SimpleIcons.python;
  if (name.contains('figma')) return SimpleIcons.figma;
  if (name.contains('vscode') || name.contains('vs code') || name.contains('visual studio code')) return SimpleIcons.vscodium;
  if (name.contains('android studio')) return SimpleIcons.androidstudio;
  if (name.contains('postman')) return SimpleIcons.postman;
  if (name.contains('github')) return SimpleIcons.github;
  if (name.contains('git')) return SimpleIcons.git;
  if (name.contains('mysql')) return SimpleIcons.mysql;
  if (name.contains('sqlite')) return SimpleIcons.sqlite;
  if (name.contains('html')) return SimpleIcons.html5;
  if (name.contains('css')) return SimpleIcons.css;
  if (name.contains('js') || name.contains('javascript')) return SimpleIcons.javascript;
  if (name.contains('react')) return SimpleIcons.react;
  if (name.contains('c++')) return SimpleIcons.cplusplus;
  if (name.contains('c')) return SimpleIcons.c;
  
  // Generic symbols for concepts
  if (name.contains('rest api') || name.contains('api')) return Symbols.api;
  if (name.contains('integration')) return Symbols.integration_instructions;
  if (name.contains('ui/ux') || name.contains('design')) return Symbols.design_services;
  if (name.contains('problem solving') || name.contains('critical thinking')) return Symbols.psychology;
  if (name.contains('ai') || name.contains('machine learning')) return Symbols.psychology;
  if (name.contains('ocr') || name.contains('scanner')) return Symbols.document_scanner;
  if (name.contains('nlp') || name.contains('language')) return Symbols.translate;
  if (name.contains('cross-platform') || name.contains('mobile')) return Symbols.devices;
  if (name.contains('time management')) return Symbols.schedule;
  if (name.contains('collaboration') || name.contains('communication')) return Symbols.groups;

  return null;
}

Color? getTechColor(String techName) {
  final name = techName.toLowerCase().trim();
  
  if (name.contains('flutter')) return AppColors.brandFlutter;
  if (name.contains('dart')) return AppColors.brandDart;
  if (name.contains('firebase')) return AppColors.brandFirebase;
  if (name.contains('gemini')) return const Color(0xFF8E75FF);
  if (name.contains('python')) return AppColors.brandPython;
  if (name.contains('figma')) return AppColors.figma;
  if (name.contains('vscode') || name.contains('vs code')) return AppColors.brandVsCode;
  if (name.contains('android studio')) return AppColors.brandAndroidStudio;
  if (name.contains('github')) return AppColors.brandGithub;
  if (name.contains('git')) return AppColors.brandGit;
  if (name.contains('mysql')) return AppColors.brandMysql;
  if (name.contains('sqlite')) return const Color(0xFF003B57);
  if (name.contains('html')) return AppColors.brandHtml;
  if (name.contains('css')) return AppColors.brandCss;
  
  return null;
}
