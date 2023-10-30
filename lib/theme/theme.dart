import 'package:flutter/material.dart';
import 'package:shop_test/theme/app_colors.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    centerTitle: true,
    backgroundColor: AppColors.whiteColor,
    titleTextStyle: TextStyle(
      fontFamily: 'OpenSans_Regular',
      fontSize: 14,
      color: AppColors.darkColor,
    ),
  ),
  colorScheme: const ColorScheme.light(
    background: AppColors.whiteColor,
    primary: AppColors.lightColor,
    secondary: AppColors.darkColor,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      fontFamily: 'OpenSans_Regular',
      fontSize: 13,
      color: AppColors.darkColor,
    ),
    labelSmall: TextStyle(
      fontFamily: 'OpenSans_Light',
      fontSize: 13,
      color: AppColors.darkColor,
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    centerTitle: true,
    backgroundColor: Color.fromARGB(255, 50, 50, 50),
    titleTextStyle: TextStyle(
      fontFamily: 'OpenSans_Regular',
      fontSize: 14,
      color: AppColors.whiteColor,
    ),
  ),
  colorScheme: const ColorScheme.dark(
      background: Color.fromARGB(255, 50, 50, 50),
      primary: Color.fromARGB(255, 70, 70, 70),
      secondary: Colors.white),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      fontFamily: 'OpenSans_Regular',
      fontSize: 13,
      color: Colors.white,
    ),
    labelSmall: TextStyle(
      fontFamily: 'OpenSans_Light',
      fontSize: 13,
      color: Colors.white,
    ),
  ),
);
