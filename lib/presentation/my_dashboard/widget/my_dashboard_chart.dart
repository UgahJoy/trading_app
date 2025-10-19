import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/shared_widgets/filter_widget.dart';
import 'package:trading_app/shared_widgets/app_chart_widget.dart';
import 'package:trading_app/shared_widgets/trade_history_widget.dart';
import 'package:trading_app/theme/colors.dart';

class MyDashboardChart extends StatelessWidget {
  MyDashboardChart({super.key});
  final List<FlSpot> spotsData = [
    FlSpot(0, 2),
    FlSpot(1, 3),
    FlSpot(2, 4),
    FlSpot(3, 5),
    FlSpot(4, 6),
    FlSpot(5, 6),
    FlSpot(6, 6),
    FlSpot(7, 6),
    FlSpot(8, 4),
    FlSpot(9, 6),
    FlSpot(10, 6),
    FlSpot(11, 7),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        border: Border.all(color: AppColors.navBorder),
        color: AppColors.navGrey,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Gap(20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: FilterWidget(text: "Copy trading PNL"),
            ),
            Gap(12),
            AppChartItem(
              valueSpots: spotsData.map((e) => FlSpot(e.x, e.y)).toList(),
            ),
            Gap(16),
            Container(
              height: 2,
              decoration: BoxDecoration(color: AppColors.scaffoldBgColor),
            ),
            Gap(20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: FilterWidget(text: "Trading History"),
            ),

            ListView.builder(
              padding: EdgeInsets.only(top: 16),
              itemCount: 2,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  TradeHistoryWidget(isCurrentTrade: false),
            ),
          ],
        ),
      ),
    );
  }
}
