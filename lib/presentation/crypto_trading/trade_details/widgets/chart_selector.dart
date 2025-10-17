import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/shared_widgets/app_Inkwell.dart';
import 'package:trading_app/theme/app_textstyle.dart';
import 'package:trading_app/theme/colors.dart';

class ChartsSelector extends StatelessWidget {
  final String text;
  final int index;
  final int currentIndex;
  final Function() onTap;
  const ChartsSelector({
    super.key,
    required this.onTap,
    required this.currentIndex,
    required this.index,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return AppInkWell(
      onTap: onTap,
      child: Column(
        children: [
          Gap(14),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: subHeader.copyWith(
                color: index == currentIndex
                    ? AppColors.primaryColor
                    : AppColors.iconGrey,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
          Gap(8),
          AnimatedContainer(
            duration: Duration(milliseconds: 800),
            height: 2,
            color: index == currentIndex
                ? AppColors.indicatorBlue
                : AppColors.transparent,
          ),
        ],
      ),
    );
  }
}
