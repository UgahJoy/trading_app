import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/helper_function.dart';
import 'package:trading_app/models/all_copy_traders_model.dart';
import 'package:trading_app/shared_widgets/name_abbrevation_widget.dart';
import 'package:trading_app/theme/app_textstyle.dart';
import 'package:trading_app/theme/colors.dart';

class AllCopiersDetials extends StatelessWidget {
  final AllCopyTradersModel model;
  final Color color;
  final Color bgColor;
  final bool showCopy;
  final bool lastItem;
  final bool showTag;
  const AllCopiersDetials({
    super.key,
    required this.color,
    this.showTag = true,
    this.showCopy = true,
    required this.model,
    this.lastItem = false,
    required this.bgColor,
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
                showCopy: showCopy,
                name: cleanInitials(model.nickname ?? ""),
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
                    model.nickname ?? "",
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
        ),

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
