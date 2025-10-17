// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:trading_app/shared_widgets/app_statistics_widget.dart';

class TradeingStatistics extends StatelessWidget {
  TradeingStatistics({super.key});

  List<String> tradingPairItem = [
    "BTCUSDT",
    "ETHUSDT",
    "XRPUSDT",
    "TIAUSDT",
    "DOGEUSDT",
    "PERPUSDT",
    "TIAUSDT",
    "DOGEUSDT",
    "PERPUSDT",
    "TIAUSDT",
    "DOGEUSDT",
    "PERPUSDT",
  ];
  @override
  Widget build(BuildContext context) {
    return AppStatisticsWidget(
      bottomBorderRadius: 0,
      tradingPairItem: tradingPairItem,
    );
  }
}
