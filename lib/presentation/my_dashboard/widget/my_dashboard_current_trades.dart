import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/extensions.dart';
import 'package:trading_app/shared_widgets/trade_history_widget.dart';
import 'package:trading_app/theme/colors.dart';

class MyDashboardCurrentTrades extends StatelessWidget {
  const MyDashboardCurrentTrades({super.key});

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
      child: Column(
        children: [
          ListView.builder(
            itemCount: 2,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => TradeHistoryWidget(),
          ),
        ],
      ),
    );
  }
}
