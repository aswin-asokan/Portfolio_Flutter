import 'package:flutter/material.dart';
import 'package:portfolio/core/themes/darkmode.dart';
import 'package:portfolio/core/themes/lightmode.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme = lightmode;

  setLightMode() {
    currentTheme = lightmode;
    notifyListeners();
  }

  setDarkmode() {
    currentTheme = darkmode;
    notifyListeners();
  }
}
