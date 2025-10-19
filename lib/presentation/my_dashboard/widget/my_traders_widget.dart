import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/helper_function.dart';
import 'package:trading_app/shared_widgets/name_abbrevation_widget.dart';
import 'package:trading_app/theme/app_textstyle.dart';
import 'package:trading_app/theme/colors.dart';

class MyTradersWidget extends StatelessWidget {
  final String tradersName;
  final Color bgColor;
  final bool isLastItem;
  const MyTradersWidget({
    super.key,
    required this.tradersName,
    required this.bgColor,
    required this.isLastItem,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: NameAbbrevationWidget(
                showTag: false,
                showCopy: true,
                name: cleanInitials(tradersName),
                borderColor: bgColor,
                bgColor: bgColor.withValues(alpha: 0.14),
              ),
            ),

            Gap(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tradersName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),

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
        ),

        Gap(12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
                  Text(
                    "278.81 USDT",
                    textAlign: TextAlign.right,
                    style: header2,
                  ),
                ],
              ),
            ],
          ),
        ),

        isLastItem
            ? SizedBox()
            : Container(
                margin: EdgeInsets.only(left: 16, top: 24, bottom: 20),
                height: 2,
                decoration: BoxDecoration(color: AppColors.scaffoldBgColor),
              ),
      ],
    );
  }
}
