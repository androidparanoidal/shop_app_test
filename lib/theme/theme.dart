import 'package:flutter/material.dart';
import 'package:shop_test/theme/app_colors.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.whiteColor,
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
);
