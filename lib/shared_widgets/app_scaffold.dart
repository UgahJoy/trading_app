import 'package:flutter/material.dart';
import 'package:trading_app/helper_files/constants.dart';
import 'package:trading_app/theme/app_theme.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final Widget? bottomNavigationBar;
  final bool top;
  final bool bottom;
  final bool extendBody;
  final double? horizontalScreenPadding;
  const AppScaffold({
    super.key,
    required this.body,
    this.bottomNavigationBar,
    this.bottom = true,
    this.horizontalScreenPadding,
    this.top = true,
    this.extendBody = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        extendBody: extendBody,
        bottomNavigationBar: bottomNavigationBar,
        backgroundColor: appTheme.scaffoldBackgroundColor,
        body: SafeArea(
          top: top,
          bottom: bottom,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalScreenPadding ?? screenPaddding,
            ),
            child: body,
          ),
        ),
      ),
    );
  }
}
