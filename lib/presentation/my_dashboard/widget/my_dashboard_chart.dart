import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/presentation/crypto_trading/trade_details/widgets/filter_widget.dart';
import 'package:trading_app/presentation/my_dashboard/widget/my_dashboard_trade_history.dart';
import 'package:trading_app/shared_widgets/app_chart_widget.dart';
import 'package:trading_app/theme/colors.dart';

class MyDashboardChart extends StatelessWidget {
  const MyDashboardChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
        border: Border.all(color: AppColors.navBorder),
        color: AppColors.navGrey,
      ),
      child: Column(
        children: [
          Gap(20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: FilterWidget(text: "Copy trading PNL"),
          ),
          Gap(12),
          AppChartItem(),
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
          MyDashboardTradeHistory(),
        ],
      ),
    );
  }
}
