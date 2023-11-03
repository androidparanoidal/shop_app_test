import 'package:flutter/material.dart';
import 'package:shop_test/theme/theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightTheme;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  // void toggleTheme() {
  //   if (_themeData == lightTheme) {
  //     themeData = darkTheme;
  //   } else {
  //     themeData = lightTheme;
  //   }
  // }

  void turnDarkTheme() {
    if (_themeData == lightTheme) {
      themeData = darkTheme;
    } else {
      themeData = darkTheme;
    }
  }

  void turnLightTheme() {
    if (_themeData == darkTheme) {
      themeData = lightTheme;
    } else {
      themeData = lightTheme;
    }
  }
}
