import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/theme/colors.dart';

class FilterItem extends StatelessWidget {
  const FilterItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: AppColors.iconGrey.withValues(alpha: 0.08),
      ),
      child: Row(
        children: [
          Text(
            "7 days",
            style: TextStyle(fontSize: 14, color: AppColors.primaryColor),
          ),
          Gap(8),
          Image.asset(
            color: AppColors.primaryColor,
            "assets/expand_more_2.png",
            height: 18,
          ),
        ],
      ),
    );
  }
}
