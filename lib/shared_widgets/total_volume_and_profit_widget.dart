import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/models/all_copy_traders_model.dart';
import 'package:trading_app/theme/app_textstyle.dart';

class TotalVolumeAndProfitWidget extends StatelessWidget {
  final AllCopyTradersModel model;
  const TotalVolumeAndProfitWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Total volume"),
                Gap(8),
                Text(
                  "${(model.balanceAmount)?.toStringAsFixed(2)} USDT",
                  style: header2,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Trading profit", textAlign: TextAlign.right),
              Gap(8),
              Text(
                "${(model.totalPnl)?.toStringAsFixed(2)} USDT",
                textAlign: TextAlign.right,
                style: header2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
