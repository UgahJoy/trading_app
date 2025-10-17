import 'package:flutter/material.dart';
import 'package:trading_app/helper_files/global_variables.dart';
import 'package:trading_app/theme/colors.dart';

class AppTextstyle {
  const AppTextstyle._();
  static TextStyle header({
    String fontFamily = "EncodeSans_Expanded",
    TextOverflow? overflow,

    Color color = AppColors.primaryColor,
    FontWeight fontWeight = FontWeight.w800,
    double fontSize = 24,
    double height = 1.3,
  }) => Theme.of(navigatorKey.currentState!.context).textTheme.titleMedium!
      .copyWith(
        fontFamily: fontFamily,
        overflow: overflow,
        color: color,
        height: height,
        fontWeight: fontWeight,
        fontSize: fontSize,
      );
  static TextStyle header2({
    String fontFamily = "EncodeSans_Expanded",
    TextOverflow? overflow,

    Color color = AppColors.primaryColor,
    FontWeight fontWeight = FontWeight.w700,
    double fontSize = 14,
    double height = 1.3,
  }) => Theme.of(navigatorKey.currentState!.context).textTheme.titleMedium!
      .copyWith(
        fontFamily: fontFamily,
        overflow: overflow,
        color: color,
        height: height,
        fontWeight: fontWeight,
        fontSize: fontSize,
      );
  static TextStyle subHeaders({
    String fontFamily = "Inter",
    TextOverflow? overflow,
    bool? inherit,
    Color color = AppColors.primaryColor,
    double height = 1.5,
    FontWeight fontWeight = FontWeight.w400,
    double fontSize = 16,
  }) => Theme.of(navigatorKey.currentState!.context).textTheme.bodyMedium!
      .copyWith(
        fontFamily: fontFamily,
        overflow: overflow,
        inherit: inherit,
        fontWeight: fontWeight,
        color: color,
        height: height,
        fontSize: fontSize,
      );

  static TextStyle captionText({
    String fontFamily = "Inter",
    TextOverflow? overflow,
    bool? inherit,
    Color color = AppColors.primaryColor,
    double height = 1.5,
    FontWeight fontWeight = FontWeight.w400,
    double fontSize = 14,
  }) => Theme.of(navigatorKey.currentState!.context).textTheme.bodyMedium!
      .copyWith(
        fontFamily: fontFamily,
        overflow: overflow,
        inherit: inherit,
        fontWeight: fontWeight,
        color: color,
        height: height,
        fontSize: fontSize,
      );
}

TextStyle header = AppTextstyle.header();
// TextStyle header = AppTextstyle.header();
TextStyle header2 = AppTextstyle.header2();
TextStyle subHeader = AppTextstyle.subHeaders();
