// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/constants.dart';
import 'package:trading_app/helper_files/extensions.dart';
import 'package:trading_app/presentation/crypto_trading/trade_details/widgets/filter_widget.dart';
import 'package:trading_app/presentation/my_dashboard/widget/statictics_item.dart';
import 'package:trading_app/presentation/my_dashboard/widget/trading_pair_item.dart';
import 'package:trading_app/theme/app_textstyle.dart';
import 'package:trading_app/theme/colors.dart';

class MyDashboardStats extends StatelessWidget {
  MyDashboardStats({super.key});
  List<DataTum> statictis = [
    DataTum(title: "PRO traders", value: "17", isPro: true),
    DataTum(title: "Trading days", value: "43"),
    DataTum(title: "Profit-share", value: "15%"),
    DataTum(title: "Total orders", value: "56"),
    DataTum(title: "Average losses", value: "0 USDT", isLoss: true),
    DataTum(title: "Total copy trades", value: "72"),
    DataTum(title: "Trading days", value: "17"),
    DataTum(title: "Total orders", value: "37"),
  ];
  List<String> tradingPairItem = [
    "BTCUSDT",
    "ETHUSDT",
    "XRPUSDT",
    "TIAUSDT",
    "DOGEUSDT",
    "PERPUSDT",
    "TIAUSDT",
    "DOGEUSDT",
    "PERPUSDT",
    "TIAUSDT",
    "DOGEUSDT",
    "PERPUSDT",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
        border: Border(
          right: BorderSide(color: AppColors.navBorder),
          left: BorderSide(color: AppColors.navBorder),
        ),
        color: AppColors.navGrey,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: FilterWidget(text: "Trading statistics"),
            ),
            SizedBox(
              height: context.deviceHeight * 0.4,
              child: ListView.builder(
                itemCount: statictis.length,

                itemBuilder: (context, index) => StatisticsItem(
                  text: statictis[index].title,
                  value: statictis[index].value,
                  isLoss: statictis[index].isLoss,
                  isPro: statictis[index].isPro,
                  isLast: (index < statictis.length - 1),
                ),
              ),
            ),

            Container(
              height: 6,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.navBorder),
                  top: BorderSide(color: AppColors.navBorder),
                ),
                color: AppColors.scaffoldBgColor,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(24),
                ),
                color: AppColors.navGrey,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(20),
                    Text(
                      "Trading pairs",
                      style: header2.copyWith(fontSize: 12),
                    ),

                    Gap(20),

                    Wrap(
                      direction: Axis.horizontal,
                      spacing: 12.0,
                      runSpacing: 12.0,
                      children: tradingPairItem
                          .map((e) => TradingPairItem(text: e))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
            Gap(bottomPaddding),
          ],
        ),
      ),
    );
  }
}

class DataTum {
  final String title;
  final String value;
  final bool? isLoss;
  final bool? isPro;
  DataTum({this.isLoss, this.isPro, required this.title, required this.value});
}
