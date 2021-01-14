import 'package:flutter/material.dart';

ThemeData light = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.indigo,
    accentColor: Colors.pink,
    scaffoldBackgroundColor: Color(0xfff1f1f1));

ThemeData dark = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.indigo,
  accentColor: Colors.pink,
);

class ThemeNotifier extends ChangeNotifier {
  final String key = "theme";

  bool _darkTheme;
  bool get darkTheme => _darkTheme;
  ThemeNotifier() {
    _darkTheme = true;
  }
  toggleTheme() {
    _darkTheme = !_darkTheme;
    notifyListeners();
  }
}
