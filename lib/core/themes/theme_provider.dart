import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  static const String _themePrefKey = 'theme_preference';
  ThemeMode _themeMode = ThemeMode.light;
  bool _isSwitchingTheme = false;

  ThemeProvider() {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final savedTheme = prefs.getString(_themePrefKey);
    
    if (savedTheme != null) {
      _themeMode = savedTheme == 'dark' ? ThemeMode.dark : ThemeMode.light;
      notifyListeners();
    }
  }

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
    
    // Save to SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themePrefKey, _themeMode == ThemeMode.dark ? 'dark' : 'light');

    notifyListeners();

    // Allow the widget tree to rebuild and paint with the new theme
    await Future.delayed(const Duration(milliseconds: 600));

    _isSwitchingTheme = false;
    notifyListeners();
  }
}
