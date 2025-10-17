import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/shared_widgets/app_net_work_image.dart';
import 'package:trading_app/theme/colors.dart';

class TradeHistoryWidget extends StatelessWidget {
  final bool isTradeHistory;
  const TradeHistoryWidget({super.key, required this.isTradeHistory});

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

        if (isTradeHistory) ...[
          Item(title: "Entry price", value: "1.9661 USDT"),
          Item(title: "Exit price", value: "1.9728 USDT"),
          Item(title: "Copiers ", value: "120"),
          Item(title: "Copiers amount", value: "1009.772 USDT"),
          Item(title: "Entry time", value: "01:22 PM"),
          Item(title: "Exit time", value: "01:22 PM"),
          Gap(20),
        ] else ...[
          Item(showImage: true, title: "PRO trader", value: "BTC master"),
          Item(title: "Entry price", value: "1.9661 USDT"),
          Item(title: "Exit price", value: "1.9728 USDT"),
          Item(title: "PRO trader amount", value: "1009.772 USDT"),
          Item(title: "Entry time", value: "01:22 PM"),
          Item(title: "Exit time", value: "01:22 PM"),
          Gap(20),
        ],
      ],
    );
  }
}

class Item extends StatelessWidget {
  final String title;
  final String value;
  final bool showImage;
  const Item({
    super.key,
    this.showImage = false,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 0),
      child: Row(
        children: [
          Expanded(child: Text(title, style: TextStyle(fontSize: 14))),
          if (showImage) ...[
            Stack(
              children: [
                Container(
                  height: 21,
                  width: 18,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: AppColors.primaryColor),
                  ),

                  //
                  child: AppNetWorkImage(imageUrl: ""),
                ),
                Positioned(
                  bottom: 0,
                  right: -1,
                  child: Image.asset("assets/pro_verified.png", height: 10),
                ),
              ],
            ),
            Gap(6),
          ],
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: showImage
                  ? AppColors.indicatorBlue
                  : AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
