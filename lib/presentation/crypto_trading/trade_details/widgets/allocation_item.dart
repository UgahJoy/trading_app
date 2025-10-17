// ignore_for_file: deprecated_member_use

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/constants.dart';
import 'package:trading_app/presentation/crypto_trading/trade_details/widgets/filter_widget.dart';
import 'package:trading_app/theme/app_textstyle.dart';

import 'package:trading_app/theme/colors.dart';

class AllocationItem extends StatelessWidget {
  const AllocationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: screenPaddding),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.navBorder),
        color: AppColors.navGrey,
      ),
      child: Column(
        children: [
          Gap(20),
          FilterWidget(text: "Assets allocation"),
          Gap(20),
          SizedBox(height: 184, child: AppPieChart()),
          Gap(30),
        ],
      ),
    );
  }
}

class AppPieChart extends StatelessWidget {
  const AppPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        PieChart(
          swapAnimationDuration: Duration(milliseconds: 500),
          PieChartData(
            startDegreeOffset: -90,
            centerSpaceRadius: 65,
            centerSpaceColor: AppColors.scaffoldBgColor,
            sectionsSpace: 0,
            sections: [
              PieChartSectionData(radius: 30, color: Color(0xffFBC98D)),
            ],
          ),
        ),

        PieChart(
          swapAnimationDuration: Duration(milliseconds: 500),
          PieChartData(
            centerSpaceRadius: 70,
            centerSpaceColor: AppColors.scaffoldBgColor,
            sectionsSpace: 0,
            sections: [
              PieChartSectionData(
                radius: 6,
                color: AppColors.pieChartInnerYellow,
              ),
            ],
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "BTCUSDT",
              style: const TextStyle(
                color: AppColors.primaryColor,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 8),
            Text("100.00%", style: header2),
          ],
        ),
      ],
    );
  }
}
