import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/shared_widgets/trade_histry_widget_item.dart';
import 'package:trading_app/theme/colors.dart';

class TradeHistoryWidget extends StatelessWidget {
  final bool isCurrentTrade;
  const TradeHistoryWidget({super.key, required this.isCurrentTrade});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          color: AppColors.updateGrey,
          child: Row(
            children: [
              Image.asset("assets/btc.png", height: 20),
              Gap(8),
              Expanded(
                child: RichText(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    text: "BTCUSDT - ",
                    style: TextStyle(fontSize: 14),
                    children: [
                      TextSpan(
                        text: "10X",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.indicatorBlue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Text(
                "+3.28% ROI ",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.chartGreen,
                ),
              ),
            ],
          ),
        ),

        if (isCurrentTrade) ...[
          TradeHistoryWidgetItem(
            showImage: true,
            title: "PRO trader",
            value: "BTC master",
          ),
          TradeHistoryWidgetItem(title: "Entry price", value: "1.9661 USDT"),
          TradeHistoryWidgetItem(title: "Market price", value: "1.9728 USDT"),

          TradeHistoryWidgetItem(title: "Entry time", value: "01:22 PM"),

          Gap(20),
        ] else ...[
          TradeHistoryWidgetItem(
            showImage: true,
            title: "PRO trader",
            value: "BTC master",
          ),
          TradeHistoryWidgetItem(title: "Entry price", value: "1.9661 USDT"),
          TradeHistoryWidgetItem(title: "Exit price", value: "1.9728 USDT"),
          TradeHistoryWidgetItem(
            title: "PRO trader amount",
            value: "1009.772 USDT",
          ),
          TradeHistoryWidgetItem(title: "Entry time", value: "01:22 PM"),
          TradeHistoryWidgetItem(title: "Exit time", value: "01:22 PM"),
          Gap(20),
        ],
      ],
    );
  }
}
