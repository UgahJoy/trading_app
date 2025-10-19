import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/all_datums.dart';
import 'package:trading_app/shared_widgets/app_border_container.dart';
import 'package:trading_app/shared_widgets/filter_widget.dart';
import 'package:trading_app/shared_widgets/app_chart_widget.dart';
import 'package:trading_app/shared_widgets/trade_history_widget.dart';
import 'package:trading_app/theme/colors.dart';

class MyDashboardChart extends StatelessWidget {
  const MyDashboardChart({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBorderContainer(
      bottomPadding: 20,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Gap(20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: FilterWidget(text: "Copy trading PNL"),
            ),
            Gap(12),
            AppChartItem(isPNL: true, valueSpots: spotsData),
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
