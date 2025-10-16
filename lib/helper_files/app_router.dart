import 'package:flutter/material.dart';
import 'package:trading_app/helper_files/global_variables.dart';

String? currentRoute;

class AppRouter {
  static replaceWith(Widget route) {
    currentRoute = route.runtimeType.toString();
    return navigatorKey.currentState!.pushReplacement(
      MaterialPageRoute(builder: (context) => route),
    );
  }

  static navigateTo(Widget route) async {
    currentRoute = route.runtimeType.toString();
    return await navigatorKey.currentState!.push(
      MaterialPageRoute(
        settings: RouteSettings(name: currentRoute),
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
}
