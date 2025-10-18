import 'package:flutter/material.dart';
import 'package:trading_app/shared_widgets/app_Inkwell.dart';
import 'package:trading_app/theme/colors.dart';

class LinearIndicator extends StatelessWidget {
  final int index;
  final int currentIndex;
  final Function() onTap;
  const LinearIndicator({
    super.key,
    required this.index,
    required this.onTap,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return AppInkWell(
      onTap: onTap,
      child: AnimatedContainer(
        curve: Curves.fastEaseInToSlowEaseOut,
        duration: Duration(seconds: 20),
        height: 16,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: AppColors.transparent,
        ),
        child: Center(
          child: Container(
            height: 2,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: index <= currentIndex
                  ? AppColors.indicatorBlue
                  : AppColors.indicatorGrey,
            ),
          ),
        ),
      ),
    );
  }
}
