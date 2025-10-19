import 'package:flutter/material.dart';
import 'package:trading_app/presentation/copy_trading/trading_details/widgets/trade_history_selector_item.dart';
import 'package:trading_app/theme/colors.dart';

class TradeHistorySelector extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  const TradeHistorySelector({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 20),

      decoration: BoxDecoration(
        color: AppColors.updateGrey,
        borderRadius: BorderRadius.circular(8),
      ),

      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          children: [
            TradeHistotySelectorItem(
              text: "Current trades",
              currentIndex: currentIndex,
              index: 0,
              onTap: () {
                onTap(0);
              },
            ),
            TradeHistotySelectorItem(
              text: "History",
              currentIndex: currentIndex,
              index: 1,
              onTap: () {
                onTap(1);
              },
            ),
          ],
        ),
      ),
    );
  }
}
