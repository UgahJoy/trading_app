import 'package:flutter/material.dart';
import 'package:trading_app/shared_widgets/app_Inkwell.dart';
import 'package:trading_app/theme/colors.dart';

class TradeHistotySelectorItem extends StatelessWidget {
  final int index;
  final int currentIndex;
  final String text;
  final Function() onTap;
  const TradeHistotySelectorItem({
    super.key,
    required this.currentIndex,
    required this.index,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppInkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(2.5),
        padding: EdgeInsets.symmetric(
          horizontal: index == 0 ? 12 : 34,
          vertical: 4,
        ),
        decoration: BoxDecoration(
          color: index == currentIndex
              ? AppColors.scaffoldBgColor
              : AppColors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
