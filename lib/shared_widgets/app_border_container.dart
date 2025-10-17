import 'package:flutter/material.dart';
import 'package:trading_app/theme/colors.dart';

class AppBorderContainer extends StatelessWidget {
  final Widget child;
  final double? borderRadius;
  const AppBorderContainer({super.key, required this.child, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 16),
        color: AppColors.navGrey,
        border: Border.all(color: AppColors.navBorder),
      ),
      child: child,
    );
  }
}
