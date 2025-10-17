import 'package:flutter/material.dart';
import 'package:trading_app/presentation/my_dashboard/widget/my_dashboard_chart_trade_history.dart';
import 'package:trading_app/theme/colors.dart';

class AllTradeHistory extends StatelessWidget {
  const AllTradeHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
        border: Border(
          bottom: BorderSide(color: AppColors.navBorder),
          right: BorderSide(color: AppColors.navBorder),
          left: BorderSide(color: AppColors.navBorder),
        ),
        color: AppColors.navGrey,
      ),
      //  child: MyDashboardTradeHistory(),
    );
  }
}
