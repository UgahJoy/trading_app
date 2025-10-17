import 'package:flutter/material.dart';
import 'package:trading_app/shared_widgets/trade_history_widget.dart';

class MyChartDashboardTradeHistory extends StatelessWidget {
  const MyChartDashboardTradeHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          itemCount: 2,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => TradeHistoryWidget(),
        ),
      ],
    );
  }
}
