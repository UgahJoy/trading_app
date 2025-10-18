import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/constants.dart';
import 'package:trading_app/presentation/copy_trading/trade_details/widgets/allocation_item.dart';
import 'package:trading_app/shared_widgets/filter_widget.dart';
import 'package:trading_app/presentation/copy_trading/trade_details/widgets/holding_period_item.dart';
import 'package:trading_app/shared_widgets/app_border_container.dart';
import 'package:trading_app/shared_widgets/app_chart_widget.dart';
import 'package:trading_app/theme/colors.dart';

class TradingDetailsChart extends StatelessWidget {
  const TradingDetailsChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.navBorder),
              color: AppColors.navGrey,
            ),
            child: Column(
              children: [
                Gap(20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenPaddding),
                  child: FilterWidget(text: "RIO"),
                ),
                AppChartItem(),
                Gap(16),
              ],
            ),
          ),
          Gap(4),
          AppBorderContainer(
            horizontalPadding: 0,
            borderRadius: 0,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenPaddding),
                  child: FilterWidget(text: "Total PNL"),
                ),
                AppChartItem(),
              ],
            ),
          ),
          Gap(4),
          AllocationItem(),
          Gap(4),
          HoldingPeriodItem(),
          Gap(bottomPaddding),
        ],
      ),
    );
  }
}


/*



      

 
            

                  Gap(8),
            ,*/