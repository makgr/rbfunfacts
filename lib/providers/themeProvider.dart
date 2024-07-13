import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkModeChecked = false;

  void updateMode({required bool darkMode}) {
    isDarkModeChecked = darkMode;
    notifyListeners();
  }
}
