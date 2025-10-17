import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/shared_widgets/app_border_container.dart';
import 'package:trading_app/theme/app_textstyle.dart';
import 'package:trading_app/theme/colors.dart';

class NetProfit extends StatelessWidget {
  const NetProfit({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBorderContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Copy trading assets"),
          Gap(8),
          Text("\$5,564.96", style: header2),
          Gap(12),
          Divider(),
          Gap(12),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Net profit"),
                    Gap(12),
                    Text("\$5,564.96", style: header2),
                  ],
                ),
              ),
              Column(
                children: [
                  Text("Today’s PNL"),
                  Gap(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset("assets/trending_down.png", height: 16),
                      Gap(8),
                      Text(
                        "207.25",
                        style: header2.copyWith(color: AppColors.chartGreen),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
