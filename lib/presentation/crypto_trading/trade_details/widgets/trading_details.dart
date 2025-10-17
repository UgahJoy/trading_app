import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/constants.dart';
import 'package:trading_app/presentation/crypto_trading/trade_details/widgets/chart_selector.dart';
import 'package:trading_app/presentation/crypto_trading/trade_details/widgets/filter_widget.dart';
import 'package:trading_app/shared_widgets/app_chart_widget.dart';
import 'package:trading_app/theme/colors.dart';

class TradingDetailsChart extends StatelessWidget {
  final int currentIndex;
  final Function(int) onChanged;
  const TradingDetailsChart({
    super.key,
    required this.currentIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.navBorder),
            color: AppColors.scaffoldBgColor,
          ),
          child: Row(
            children: [
              Expanded(
                child: ChartsSelector(
                  text: "Chart",
                  currentIndex: currentIndex,
                  index: 0,
                  onTap: () {
                    onChanged(0);
                  },
                ),
              ),
              Expanded(
                child: ChartsSelector(
                  text: "Stats",
                  currentIndex: currentIndex,
                  index: 1,
                  onTap: () {
                    onChanged(1);
                  },
                ),
              ),
              Expanded(
                child: ChartsSelector(
                  text: "All Trades",
                  currentIndex: currentIndex,
                  index: 2,
                  onTap: () {
                    onChanged(2);
                  },
                ),
              ),
              Expanded(
                child: ChartsSelector(
                  text: "Copiers",
                  currentIndex: currentIndex,
                  index: 3,
                  onTap: () {
                    onChanged(3);
                  },
                ),
              ),
            ],
          ),
        ),
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
              Gap(12),
              AppChartItem(),
              Gap(16),
            ],
          ),
        ),
      ],
    );
  }
}
