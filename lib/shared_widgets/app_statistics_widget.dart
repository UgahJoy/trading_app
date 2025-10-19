import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/all_datums.dart';
import 'package:trading_app/helper_files/constants.dart';
import 'package:trading_app/shared_widgets/app_border_conatiner_2.dart';
import 'package:trading_app/shared_widgets/filter_widget.dart';
import 'package:trading_app/presentation/my_dashboard/widget/statictics_item.dart';
import 'package:trading_app/theme/app_textstyle.dart';
import 'package:trading_app/theme/colors.dart';

class AppStatisticsWidget extends StatelessWidget {
  final List<String> tradingPairItem;
  final double bottomBorderRadius;
  const AppStatisticsWidget({
    super.key,
    required this.tradingPairItem,
    this.bottomBorderRadius = 16,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AppBorderContainer2(
            horizontalPadding: 0,
            verticalPadding: 0,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: FilterWidget(text: "Trading statistics"),
                ),

                ListView.builder(
                  itemCount: statictis.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => StatisticsItem(
                    text: statictis[index].title,
                    value: statictis[index].value,
                    isLoss: statictis[index].isLoss,
                    isPro: statictis[index].isPro,
                    isLast: (index < statictis.length - 1),
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
                              .map(
                                (e) => Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: AppColors.navBorder,
                                    ),
                                    color: AppColors.updateGrey,
                                  ),
                                  child: Text(
                                    e.toUpperCase(),
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ),

                Gap(40),
              ],
            ),
          ),

          Gap(bottomPaddding),
        ],
      ),
    );
  }
}
