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
    // for price
    titleSmall: TextStyle(
      fontFamily: 'OpenSans_SemiBold',
      fontSize: 16,
      color: AppColors.darkColor,
    ),
    // for name of products
    bodyMedium: TextStyle(
      fontFamily: 'OpenSans_Light',
      fontSize: 14,
      color: AppColors.darkColor,
    ),

    // for the ordinary text fields
    labelSmall: TextStyle(
      fontFamily: 'OpenSans_Light',
      fontSize: 13,
      color: AppColors.darkColor,
    ),
    // for text in light buttons
    labelMedium: TextStyle(
      fontFamily: 'OpenSans_SemiBold',
      fontSize: 13,
      color: AppColors.darkColor,
    ),
    // for black buttons
    bodyLarge: TextStyle(
      fontFamily: 'OpenSans_SemiBold',
      fontSize: 13,
      color: AppColors.lightColor,
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
    // for price
    titleSmall: TextStyle(
      fontFamily: 'OpenSans_SemiBold',
      fontSize: 16,
      color: AppColors.whiteColor,
    ),
    // for name of products
    bodyMedium: TextStyle(
      fontFamily: 'OpenSans_Light',
      fontSize: 14,
      color: AppColors.whiteColor,
    ),
    // for the ordinary text fields
    labelSmall: TextStyle(
      fontFamily: 'OpenSans_Light',
      fontSize: 13,
      color: AppColors.whiteColor,
    ),
    // for text in light buttons
    labelMedium: TextStyle(
      fontFamily: 'OpenSans_SemiBold',
      fontSize: 13,
      color: AppColors.whiteColor,
    ),
    // for black buttons
    bodyLarge: TextStyle(
      fontFamily: 'OpenSans_SemiBold',
      fontSize: 16,
      color: AppColors.whiteColor,
    ),
  ),
);
