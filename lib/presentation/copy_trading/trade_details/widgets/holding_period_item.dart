// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/constants.dart';
import 'package:trading_app/shared_widgets/filter_widget.dart';
import 'package:trading_app/presentation/copy_trading/trade_details/widgets/holding_period_graph.dart';

import 'package:trading_app/theme/colors.dart';

class HoldingPeriodItem extends StatelessWidget {
  const HoldingPeriodItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: screenPaddding,
        vertical: screenPaddding,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.navBorder),
        color: AppColors.navGrey,
      ),
      child: Column(
        children: [
          FilterWidget(text: "Holding period"),
          Gap(20),
          HoldingPeriodGraph(),
          Gap(20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Indicator(color: AppColors.chartGreen, text: "Profit"),
              Gap(30),
              Indicator(color: AppColors.red, text: "Loss"),
            ],
          ),
        ],
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final String text;
  final Color color;
  const Indicator({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 6,
          width: 6,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        Gap(8),
        Text(
          text,
          style: TextStyle(fontSize: 12, color: AppColors.primaryColor),
        ),
      ],
    );
  }
}
