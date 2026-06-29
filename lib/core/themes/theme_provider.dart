import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  bool _isSwitchingTheme = false;

  ThemeMode get themeMode => _themeMode;
  bool get isDarkMode => _themeMode == ThemeMode.dark;
  bool get isSwitchingTheme => _isSwitchingTheme;

  Future<void> toggleTheme(BuildContext context) async {
    if (_isSwitchingTheme) return;

    final bool currentIsDark = Theme.of(context).brightness == Brightness.dark;

    _isSwitchingTheme = true;
    notifyListeners();

    // Allow overlay to fade in completely
    await Future.delayed(const Duration(milliseconds: 300));

    _themeMode = currentIsDark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();

    // Allow the widget tree to rebuild and paint with the new theme
    await Future.delayed(const Duration(milliseconds: 600));

    _isSwitchingTheme = false;
    notifyListeners();
  }
}
