import 'package:flutter/material.dart';
import 'package:trading_app/theme/colors.dart';

class AppBorderContainer2 extends StatelessWidget {
  final Widget child;
  final double? borderRadius;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? bottomBorderRadius;
  const AppBorderContainer2({
    super.key,
    required this.child,
    this.borderRadius,
    this.bottomBorderRadius,
    this.horizontalPadding,
    this.verticalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding ?? 16,
        vertical: verticalPadding ?? 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(bottomBorderRadius ?? 16),
        ),
        border: Border(
          left: BorderSide(color: AppColors.navBorder),
          right: BorderSide(color: AppColors.navBorder),
          top: BorderSide(color: AppColors.navBorder),
        ),
        color: AppColors.navGrey,
      ),
      child: child,
    );
  }
}
