import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/theme/app_textstyle.dart';
import 'package:trading_app/theme/colors.dart';

class WinRateIem extends StatelessWidget {
  const WinRateIem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: RichText(
              text: TextSpan(
                text: "Win Rate ",
                style: TextStyle(fontSize: 12, color: AppColors.iconGrey),
                children: [
                  TextSpan(
                    text: "100%",
                    style: header.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Image.asset("assets/info.png", height: 12),
          Gap(4),
          RichText(
            text: TextSpan(
              text: "AUM: ",
              style: TextStyle(fontSize: 12, color: AppColors.iconGrey),
              children: [
                TextSpan(
                  text: "38,667.29",
                  style: header.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
