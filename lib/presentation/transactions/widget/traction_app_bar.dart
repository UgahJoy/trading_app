import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/shared_widgets/app_back_button.dart';
import 'package:trading_app/theme/app_textstyle.dart';
import 'package:trading_app/theme/colors.dart';

class TractionAppBar extends StatelessWidget {
  const TractionAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppBackButton(),

        Spacer(),
        Text("Enter Amount", style: subHeader),
        Spacer(),
        Container(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: AppColors.navBorder),
            color: AppColors.navGrey,
          ),
          child: Row(
            children: [
              Image.asset("assets/us_flag.png", height: 20),
              Gap(4),
              Text(
                "USD",
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Gap(4),

              Image.asset(
                "assets/expand_more.png",
                height: 10,
                color: AppColors.primaryColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
