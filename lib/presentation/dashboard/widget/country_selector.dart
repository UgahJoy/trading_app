import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/theme/colors.dart';

class CountrySelector extends StatelessWidget {
  const CountrySelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),

        color: AppColors.cryptoShadow.withValues(alpha: 0.12),
      ),
      child: Row(
        children: [
          Image.asset("assets/flag.png", height: 20),
          Gap(12),
          Image.asset("assets/expand_more.png", height: 16),
        ],
      ),
    );
  }
}
