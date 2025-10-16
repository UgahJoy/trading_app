import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/theme/app_textstyle.dart';
import 'package:trading_app/theme/colors.dart';

class Crypto extends StatelessWidget {
  const Crypto({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: AppColors.cryptoShadow.withValues(alpha: 0.12),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Crypto",
                style: subHeader.copyWith(
                  fontSize: 13,
                  color: AppColors.scaffoldBgColor,
                  fontWeight: FontWeight.w600,
                  height: 1.4,
                ),
              ),
              Gap(10),
              Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: Image.asset("assets/expand_more.png", height: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
