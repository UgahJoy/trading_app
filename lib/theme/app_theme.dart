import 'package:flutter/material.dart';
import 'package:trading_app/theme/colors.dart';

ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.scaffoldBgColor,
  primaryColor: AppColors.primaryColor,
  primarySwatch: MaterialColor(0xffffffff, <int, Color>{
    50: AppColors.primaryColor,
    100: AppColors.primaryColor,
    200: AppColors.primaryColor,
    300: AppColors.primaryColor,
    400: AppColors.primaryColor,
    500: AppColors.primaryColor,
    600: AppColors.primaryColor,
    700: AppColors.primaryColor,
    800: AppColors.primaryColor,
    900: AppColors.primaryColor,
  }),

  textTheme: TextTheme(
    bodyMedium: TextStyle(
      height: 1.5,
      fontSize: 12,
      fontFamily: "Inter",
      fontWeight: FontWeight.w400,
      color: AppColors.iconGrey,
    ),
  ),
  useMaterial3: false,
  brightness: Brightness.dark,
  dividerTheme: DividerThemeData(
    color: AppColors.primaryColor.withValues(alpha: 0.1),
  ),
);
