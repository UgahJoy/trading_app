// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:trading_app/helper_files/global_variables.dart';
import 'package:trading_app/theme/colors.dart';

String? currentRoute;

class AppRouter {
  static replaceWith(Widget route, {isDialog = false}) {
    currentRoute = route.runtimeType.toString();
    return navigatorKey.currentState!.pushReplacement(
      MaterialPageRoute(
        fullscreenDialog: isDialog,
        builder: (context) => route,
      ),
    );
  }

  static navigateTo(Widget route, {isDialog = false}) async {
    currentRoute = route.runtimeType.toString();
    return await navigatorKey.currentState!.push(
      MaterialPageRoute(
        settings: RouteSettings(name: currentRoute),
        fullscreenDialog: isDialog,
        builder: (context) => route,
      ),
    );
  }

  static clearAllAndPush(Widget route) {
    currentRoute = route.runtimeType.toString();
    return navigatorKey.currentState!.pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => route),
      (Route<dynamic> r) => false,
    );
  }

  static Future<void> pushDialog(Widget child) {
    return showGeneralDialog(
      context: navigatorKey.currentContext!,
      barrierDismissible: true,
      barrierColor: const Color(0x00000000),
      barrierLabel: 'Dismiss',
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: (context, animation, secondaryAnimation, dialogChild) {
        final double sigma = 5 * animation.value;
        final double barrierOpacity = 0.4 * animation.value;
        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
                child: Container(
                  // Apply your custom dark barrier color with animation
                  color: AppColors.black.withValues(alpha: barrierOpacity),
                ),
              ),
            ),
            FadeTransition(opacity: animation, child: dialogChild),
          ],
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return Dialog(
          backgroundColor: AppColors.transparent,
          insetPadding: const EdgeInsets.symmetric(horizontal: 12),
          alignment: Alignment.bottomCenter,
          child: child,
        );
      },
    );
  }
}
