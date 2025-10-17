import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/theme/app_textstyle.dart';

class TotalVolumeAndProfitWidget extends StatelessWidget {
  const TotalVolumeAndProfitWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Total volume"),
                Gap(8),
                Text("996.28 USDT", style: header2),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Trading profit", textAlign: TextAlign.right),
              Gap(8),
              Text("278.81 USDT", textAlign: TextAlign.right, style: header2),
            ],
          ),
        ],
      ),
    );
  }
}
