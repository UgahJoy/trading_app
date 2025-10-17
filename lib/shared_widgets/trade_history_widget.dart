import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/theme/colors.dart';

class TradeHistoryWidget extends StatelessWidget {
  const TradeHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
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
                  fontWeight: FontWeight.w500,
                  color: AppColors.chartGreen,
                ),
              ),
            ],
          ),
        ),

        Item(showImage: true, title: "PRO trader", value: "BTC master"),
        Item(title: "Entry price", value: "1.9661 USDT"),
        Item(title: "Exit price", value: "1.9728 USDT"),
        Item(title: "PRO trader amount", value: "1009.772 USDT"),
        Item(title: "Entry time", value: "01:22 PM"),
        Item(title: "Exit time", value: "01:22 PM"),
        Gap(4),
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
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(100),
                  child: Image.asset(
                    "assets/pro_trader_image.png",
                    height: 25,
                    width: 18,
                  ),
                ),
                Positioned(
                  bottom: 6,
                  right: 2,
                  child: Image.asset("assets/pro_verified.png", height: 6),
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
