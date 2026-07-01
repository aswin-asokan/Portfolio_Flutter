import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:simple_icons/simple_icons.dart';

enum AppButtonType {
  download(icon: Symbols.download, text: "Download"),
  website(icon: SimpleIcons.googlechrome, text: "Website"),
  github(icon: SimpleIcons.github, text: "GitHub"),
  playstore(icon: SimpleIcons.googleplay, text: "Play Store"),
  appstore(icon: SimpleIcons.appstore, text: "App Store");

  const AppButtonType({required this.icon, required this.text});

  final IconData icon;
  final String text;
}
