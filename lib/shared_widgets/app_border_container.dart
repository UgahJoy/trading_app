import 'package:flutter/material.dart';
import 'package:trading_app/theme/colors.dart';

class AppBorderContainer extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final double horizontalPadding;
  final double horizontalMargin;
  final double verticalPadding;
  final double bottomPadding;
  const AppBorderContainer({
    super.key,
    required this.child,
    this.borderRadius = 16,
    this.bottomPadding = 0,
    this.horizontalMargin = 0,
    this.verticalPadding = 16,
    this.horizontalPadding = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: horizontalMargin,
        right: horizontalMargin,
        bottom: bottomPadding,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: AppColors.navGrey,
        border: Border.all(color: AppColors.navBorder),
      ),
      child: child,
    );
  }
}
