import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/theme/app_textstyle.dart';
import 'package:trading_app/theme/colors.dart';

class FilterWidget extends StatelessWidget {
  final String text;

  const FilterWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: header2.copyWith(fontSize: 12),
          ),
        ),
        Gap(20),
        Container(
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
        ),
      ],
    );
  }
}
