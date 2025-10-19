// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:trading_app/theme/colors.dart';

class AppInkWell extends StatelessWidget {
  final Function() onTap;
  final Widget child;
  const AppInkWell({super.key, required this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: AppColors.transparent,
      highlightColor: AppColors.transparent,
      hoverColor: AppColors.transparent,
      splashColor: AppColors.transparent,
      onTap: onTap,
      child: child,
    );
  }
}
