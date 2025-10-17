import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/constants.dart';
import 'package:trading_app/theme/app_textstyle.dart';
import 'package:trading_app/theme/colors.dart';

class CertifiedPros extends StatelessWidget {
  const CertifiedPros({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: screenPaddding, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        border: Border.all(color: AppColors.navBorder),
        color: AppColors.navGrey,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset("assets/circle_verified.png", height: 18),
              Gap(4),
              Image.asset("assets/verified.png", height: 12),
            ],
          ),
          //chartGreen. yellow
          Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            "Certified PROtrader",
            style: header2,
          ),
          Gap(8),
          Row(
            children: [
              Expanded(
                child: Item(
                  image: "assets/chart.png",
                  color: AppColors.chartGreen,
                  text: "High win rate",
                ),
              ),
              Expanded(
                child: Item(
                  image: "assets/analysis.png",
                  color: AppColors.yellow,
                  text: "Great risk control",
                ),
              ),
              Expanded(
                child: Opacity(
                  opacity: 0,
                  child: Item(
                    image: "assets/analysis.png",
                    color: AppColors.yellow,
                    text: "Great risk control",
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Item extends StatelessWidget {
  final Color color;
  final String image;
  final String text;
  const Item({
    super.key,
    required this.color,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),

        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 16),
          Gap(8),
          Expanded(
            child: Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: color, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
