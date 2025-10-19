import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/all_datums.dart';
import 'package:trading_app/theme/colors.dart';

class StatisticsItem extends StatelessWidget {
  final StaticticsDataTumItem model;
  const StatisticsItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(100),
                    child: Image.asset("assets/btc.png", height: 32, width: 32),
                  ),

                  Positioned(
                    right: 0,
                    bottom: -5,
                    child: Image.asset(
                      "assets/stats_forward_arrow.png",
                      height: 14,
                    ),
                  ),
                ],
              ),
              Gap(16),
              Expanded(child: Text(model.name)),
              Text(
                model.value,
                style: TextStyle(
                  color: model.isLoss!
                      ? AppColors.red
                      : model.isProTrader!
                      ? AppColors.indicatorBlue
                      : model.isRIO!
                      ? AppColors.chartGreen
                      : AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
        Gap(12),
        if (model.isLast!) ...[Divider()],
      ],
    );
  }
}
