import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/shared_widgets/app_Inkwell.dart';
import 'package:trading_app/theme/app_textstyle.dart';
import 'package:trading_app/theme/colors.dart';

class RiskLevelSelector extends StatelessWidget {
  final int index;
  final int currentIndex;
  final String title;
  final String body;
  final Function() onTap;
  const RiskLevelSelector({
    super.key,
    required this.body,
    required this.currentIndex,
    required this.index,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppInkWell(
      onTap: onTap,
      child: Stack(
        children: [
          index == currentIndex
              ? Positioned(
                  right: 0,
                  child: Container(
                    height: 17,
                    width: 27,
                    decoration: BoxDecoration(color: AppColors.transparent),
                    child: Center(
                      child: Image.asset(
                        fit: BoxFit.contain,
                        "assets/risk_level_selected.png",
                      ),
                    ),
                  ),
                )
              : SizedBox(),
          Container(
            margin: EdgeInsets.only(bottom: 24),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              color: index == currentIndex
                  ? AppColors.transparent
                  : AppColors.navGrey,
              border: Border.all(
                color: index == currentIndex
                    ? AppColors.indicatorBlue
                    : AppColors.navBorder,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: header.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                Gap(12),
                Text(body, style: TextStyle(height: 1.4, fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
