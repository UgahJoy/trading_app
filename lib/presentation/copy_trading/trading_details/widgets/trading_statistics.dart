// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:trading_app/helper_files/all_datums.dart';
import 'package:trading_app/shared_widgets/app_statistics_widget.dart';

class TradeingStatistics extends StatelessWidget {
  const TradeingStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStatisticsWidget(
      bottomBorderRadius: 0,
      model: tradingDetailsStatictis,
      tradingPairItem: tradingPairItem,
    );
  }
}
