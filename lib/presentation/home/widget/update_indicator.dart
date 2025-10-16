import 'package:flutter/material.dart';
import 'package:trading_app/shared_widgets/app_Inkwell.dart';
import 'package:trading_app/theme/colors.dart';

class UpdateIndicator extends StatelessWidget {
  final int index;
  final int currentIndex;
  final Function() onTap;
  const UpdateIndicator({
    super.key,
    required this.index,
    required this.onTap,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return AppInkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(4),
        height: 8,
        width: 8,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: index == currentIndex
              ? AppColors.iconGrey
              : AppColors.updateGrey,
        ),
      ),
    );
  }
}
