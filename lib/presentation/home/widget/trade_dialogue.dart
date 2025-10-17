// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/constants.dart';
import 'package:trading_app/theme/app_textstyle.dart';
import 'package:trading_app/theme/colors.dart';

class TradeDialogue extends StatelessWidget {
  TradeDialogue({super.key});
  List<DataTum> tradeOptions = [
    DataTum(title: "Buy"),
    DataTum(title: "Sell"),
    DataTum(title: "Swap"),
    DataTum(title: "Send"),
    DataTum(title: "Recieve"),
    DataTum(title: "Invest", showTag: true),
    DataTum(title: "Roqq’n’roll", showTag: true),
    DataTum(title: "Savings"),
    DataTum(
      title: "Savings",
      image: "assets/buy.png",
      imageColor: AppColors.indicatorBlue,
    ),
    DataTum(title: "Missions", showTag: true),
    DataTum(title: "Copy trading", showTag: true),
  ];

  @override
  Widget build(BuildContext context) {
    final List<DataTum> tradeSection = tradeOptions.take(6).toList();
    final List<DataTum> earnSection = tradeOptions.skip(6).take(5).toList();
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 50.0, 16.0, 100),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: AppColors.scaffoldBgColor,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Trade",
                style: header.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: AppColors.iconGrey,
                ),
              ),
              Gap(12),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.navBorder),
                  color: AppColors.navGrey,
                ),
                child: ListView.builder(
                  itemCount: tradeSection.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Column(
                    children: [
                      Gap(12),
                      TradeActions(
                        image: tradeOptions[index].image,
                        showTag: tradeOptions[index].showTag,
                        imageColor: tradeOptions[index].imageColor,
                        text: tradeOptions[index].title,
                      ),
                      index == (tradeSection.length - 1)
                          ? SizedBox()
                          : Divider(),
                    ],
                  ),
                ),
              ),

              Gap(20),
              Text(
                "Earn",
                style: header.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: AppColors.iconGrey,
                ),
              ),
              Gap(12),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.navBorder),
                  color: AppColors.navGrey,
                ),
                child: ListView.builder(
                  itemCount: earnSection.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Column(
                    children: [
                      Gap(12),
                      TradeActions(
                        image: earnSection[index].image,
                        showTag: earnSection[index].showTag,
                        imageColor: earnSection[index].imageColor,
                        text: earnSection[index].title,
                      ),
                      index == (earnSection.length - 1)
                          ? SizedBox()
                          : Divider(),
                    ],
                  ),
                ),
              ),
              Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}

class TradeActions extends StatelessWidget {
  final String text;
  final bool showTag;
  final String? image;
  final Color? imageColor;
  const TradeActions({
    super.key,
    required this.text,
    this.showTag = false,
    this.image,
    this.imageColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenPaddding, vertical: 8),
      child: Row(
        children: [
          Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              color: AppColors.updateGrey,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(
                image ?? "assets/trade.png",
                height: 16,
                color: imageColor,
              ),
            ),
          ),

          Gap(8),
          Expanded(
            child: Text(text, maxLines: 1, overflow: TextOverflow.ellipsis),
          ),
          if (showTag) ...[
            Container(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: AppColors.yellow2.withValues(alpha: 0.2),
              ),
              child: Text("New", style: TextStyle(color: AppColors.yellow)),
            ),
            Gap(8),
          ],
          Image.asset("assets/forward_arrow.png", height: 20),
        ],
      ),
    );
  }
}

class DataTum {
  final String title;
  final bool showTag;
  final String? image;
  final Color? imageColor;
  DataTum({
    required this.title,
    this.showTag = false,
    this.image,
    this.imageColor,
  });
}
