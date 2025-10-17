import 'package:flutter/material.dart';
import 'package:trading_app/theme/colors.dart';

class TradingPairItem extends StatelessWidget {
  final String text;
  const TradingPairItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.navBorder),
        color: AppColors.updateGrey,
      ),
      child: Text(text.toUpperCase(), style: TextStyle(fontSize: 14)),
    );
  }
}
