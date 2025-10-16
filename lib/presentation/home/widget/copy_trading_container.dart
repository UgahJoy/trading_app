import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/constants.dart';
import 'package:trading_app/theme/app_textstyle.dart';
import 'package:trading_app/theme/colors.dart';

class CopyTradingContainer extends StatelessWidget {
  const CopyTradingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: AlignmentGeometry.centerLeft,
          end: AlignmentGeometry.centerRight,
          stops: [0.05, 0.6, 1.0],
          colors: [
            AppColors.tradingBorderGradient1,
            AppColors.tradingBorderGradient2,
            AppColors.tradingBorderGradient3,
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(0.6),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: AlignmentGeometry.centerLeft,
              end: AlignmentGeometry.centerRight,
              stops: [0.01, 0.3, 1.0],
              colors: [
                AppColors.tradingGradient1,
                AppColors.tradingGradient2,
                AppColors.tradingGradient3,
              ],
            ),
          ),
          child: Column(
            children: [
              Gap(12),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenPaddding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Copy Trading",
                            style: header.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: AppColors.scaffoldBgColor,
                            ),
                          ),
                          Gap(4),
                          Text(
                            "Discover our latest feature. Follow and watch the PRO traders closely and win like a PRO! We are rooting for you!",
                            style: TextStyle(color: AppColors.scaffoldBgColor),
                          ),
                          Gap(20),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        fit: BoxFit.contain,
                        "assets/copy_trade_crown.png",
                        height: 85,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
