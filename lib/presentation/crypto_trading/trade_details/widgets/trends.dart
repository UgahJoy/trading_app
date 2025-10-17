import 'package:flutter/material.dart';
import 'package:trading_app/theme/colors.dart';

class Trends extends StatelessWidget {
  final String text;
  const Trends({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: AppColors.iconGrey.withValues(alpha: 0.08),
      ),
      child: Center(
        child: Text(
          text,

          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}
