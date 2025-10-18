import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:trading_app/helper_files/global_variables.dart';
import 'package:trading_app/theme/app_textstyle.dart';
import 'package:trading_app/theme/colors.dart';

class AppAlerts {
  static void showSuccess(String message) {
    if (message.isEmpty) return;
    Flushbar(
      animationDuration: const Duration(milliseconds: 500),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      borderRadius: BorderRadius.circular(8),
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      isDismissible: true,
      borderColor: const Color(0xff48C1B5),
      backgroundColor: const Color(0xffF6FFF9),
      borderWidth: 1,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.easeOut,
      titleText: Row(
        children: [
          Image.asset("assets/success_icon.png", height: 16),
          const Gap(8),
          Text(
            "Success",
            style: TextStyle(
              color: AppColors.chartGreen,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      messageText: Row(
        children: [
          const Gap(32),
          Expanded(
            child: Text(
              toBeginningOfSentenceCase(message) ?? '',
              style: TextStyle(color: AppColors.scaffoldBgColor),
            ),
          ),
        ],
      ),
    ).show(navigatorKey.currentContext!);
  }

  static void showError(String message) {
    if (message.isEmpty) return;
    Flushbar(
      animationDuration: const Duration(milliseconds: 1000),
      borderRadius: BorderRadius.circular(8),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      duration: const Duration(seconds: 4),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      isDismissible: true,
      borderColor: AppColors.red.withValues(alpha: 0.7),
      backgroundColor: AppColors.primaryColor,
      borderWidth: 1,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.easeOut,
      titleText: Row(
        children: [
          Image.asset("assets/error_icon.png", height: 16),
          const Gap(8),
          Text(
            "Error",
            style: TextStyle(color: AppColors.red, fontWeight: FontWeight.w600),
          ),
        ],
      ),
      messageText: Row(
        children: [
          const Gap(32),
          Expanded(
            child: Text(
              toBeginningOfSentenceCase(message) ?? '',
              style: TextStyle(color: AppColors.scaffoldBgColor),
            ),
          ),
        ],
      ),
    ).show(navigatorKey.currentContext!);
  }
}
