import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/theme/colors.dart';

class StatisticsItem extends StatelessWidget {
  final String text;
  final String value;
  final bool? isLoss;
  final bool? isPro;
  final bool isLast;
  const StatisticsItem({
    super.key,
    required this.value,
    required this.text,
    this.isLoss,
    this.isPro,
    this.isLast = false,
  });

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
              Expanded(child: Text(text)),
              Text(
                value,
                style: TextStyle(
                  color: isLoss == true
                      ? AppColors.red
                      : isPro == true
                      ? AppColors.indicatorBlue
                      : AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
        Gap(12),
        if (isLast) ...[Divider()],
      ],
    );
  }
}
