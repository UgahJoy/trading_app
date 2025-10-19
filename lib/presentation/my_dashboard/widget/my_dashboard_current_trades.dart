import 'package:flutter/material.dart';
import 'package:trading_app/shared_widgets/app_border_conatiner_2.dart';
import 'package:trading_app/shared_widgets/trade_history_widget.dart';

class MyDashboardCurrentTrades extends StatelessWidget {
  const MyDashboardCurrentTrades({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBorderContainer2(
      horizontalPadding: 0,
      child: ListView.builder(
        itemCount: 2,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) =>
            TradeHistoryWidget(isCurrentTrade: true),
      ),
    );
  }
}
