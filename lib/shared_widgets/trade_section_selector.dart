import 'package:flutter/material.dart';
import 'package:trading_app/shared_widgets/trade_chart_selector.dart';
import 'package:trading_app/theme/colors.dart';

class TradeSectionSelector extends StatelessWidget {
  final int currentIndex;
  final Function(int) onChanged;
  const TradeSectionSelector({
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
            border: Border(
              left: BorderSide(color: AppColors.navBorder),
              right: BorderSide(color: AppColors.navBorder),
              top: BorderSide(color: AppColors.navBorder),
            ),
            color: AppColors.scaffoldBgColor,
          ),
          child: Row(
            children: [
              Expanded(
                child: TradeChartsSelector(
                  text: "Chart",
                  currentIndex: currentIndex,
                  index: 0,
                  onTap: () {
                    onChanged(0);
                  },
                ),
              ),
              Expanded(
                child: TradeChartsSelector(
                  text: "Stats",
                  currentIndex: currentIndex,
                  index: 1,
                  onTap: () {
                    onChanged(1);
                  },
                ),
              ),
              Expanded(
                child: TradeChartsSelector(
                  text: "All Trades",
                  currentIndex: currentIndex,
                  index: 2,
                  onTap: () {
                    onChanged(2);
                  },
                ),
              ),
              Expanded(
                child: TradeChartsSelector(
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
      ],
    );
  }
}
