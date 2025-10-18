import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/shared_widgets/app_net_work_image.dart';
import 'package:trading_app/theme/colors.dart';

class TradeHistoryWidgetItem extends StatelessWidget {
  final String title;
  final String value;
  final bool showImage;
  const TradeHistoryWidgetItem({
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
