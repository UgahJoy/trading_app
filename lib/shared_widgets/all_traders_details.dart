import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/shared_widgets/name_abbrevation_widget.dart';
import 'package:trading_app/shared_widgets/total_volume_and_profit_widget.dart';
import 'package:trading_app/theme/colors.dart';

class AllTradersDetails extends StatelessWidget {
  final String name;
  final Color color;
  final Color bgColor;
  final bool showCopy;
  final bool lastItem;
  final bool showTag;
  const AllTradersDetails({
    super.key,
    required this.color,
    this.showTag = true,
    this.showCopy = true,
    required this.name,
    this.lastItem = false,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    String secondLetter = name.split(" ")[1];
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: NameAbbrevationWidget(
                showTag: false,
                showCopy: showCopy,
                name: (name[0] + secondLetter[0]).toUpperCase(),
                borderColor: color,
                bgColor: bgColor.withValues(alpha: 0.14),
              ),
            ),

            Gap(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            if (showTag) ...[
              Gap(20),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Image.asset(
                  "assets/pro_trader_tag.png",
                  height: 32,
                  width: 30,
                ),
              ),
            ],
          ],
        ),

        Gap(12),
        TotalVolumeAndProfitWidget(),

        if (lastItem) ...[
          Container(
            margin: EdgeInsets.only(
              left: showTag ? 16 : 0,
              top: 24,
              bottom: 20,
            ),
            height: 2,
            decoration: BoxDecoration(color: AppColors.scaffoldBgColor),
          ),
        ],
      ],
    );
  }
}
