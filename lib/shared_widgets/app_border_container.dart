import 'package:flutter/material.dart';
import 'package:trading_app/theme/colors.dart';

class AppBorderContainer extends StatelessWidget {
  final Widget child;
  final double? borderRadius;
  final double? horizontalPadding;
  final double? verticalPadding;
  const AppBorderContainer({
    super.key,
    required this.child,
    this.borderRadius,
    this.verticalPadding,
    this.horizontalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding ?? 16,
        vertical: verticalPadding ?? 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 16),
        color: AppColors.navGrey,
        border: Border.all(color: AppColors.navBorder),
      ),
      child: child,
    );
  }
}
