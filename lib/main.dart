import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trading_app/helper_files/global_variables.dart';
import 'package:trading_app/presentation/dashboard/dashboard.dart';
import 'package:trading_app/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MediaQuery(
        data: MediaQuery.of(
          context,
        ).copyWith(textScaler: TextScaler.linear(Platform.isIOS ? 1 : 1.03)),
        child: MaterialApp(
          navigatorKey: navigatorKey,
          scaffoldMessengerKey: scaffoldMessengerKey,
          debugShowCheckedModeBanner: false,
          theme: appTheme,
          initialRoute: "/Dashboard",
          routes: {"/Dashboard": (context) => Dashboard()},
        ),
      ),
    );
  }
}
