// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/app_router.dart';
import 'package:trading_app/helper_files/constants.dart';
import 'package:trading_app/presentation/copy_trading/trade_details/widgets/risk_bottom_sheet_2.dart';
import 'package:trading_app/shared_widgets/app_Inkwell.dart';
import 'package:trading_app/shared_widgets/app_bottom_sheet_cancel_button.dart';
import 'package:trading_app/shared_widgets/app_button.dart';
import 'package:trading_app/theme/app_textstyle.dart';
import 'package:trading_app/theme/colors.dart';

class RiskBottomSheet extends StatefulWidget {
  const RiskBottomSheet({super.key});

  @override
  State<RiskBottomSheet> createState() => _RiskBottomSheetState();
}

class _RiskBottomSheetState extends State<RiskBottomSheet> {
  bool? value = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: screenPaddding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        border: Border.all(color: AppColors.navBorder),
        color: AppColors.scaffoldBgColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppBottomSheetCancelButton(),
          Gap(20),
          Image.asset("assets/important_message.png", height: 98),
          Gap(20),
          Text("Important message!", style: header.copyWith(fontSize: 20)),
          Gap(20),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text:
                  "Don’t invest unless you’re prepared and understand the risks involved in copy trading. ",
              style: TextStyle(
                height: 1.5,
                fontSize: 15,
                color: AppColors.iconGrey,
              ),
              children: [
                TextSpan(
                  text: "Learn more",
                  style: TextStyle(
                    fontSize: 15,
                    //iconGrey
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                    color: AppColors.indicatorBlue,
                  ),
                ),
                TextSpan(
                  text: " about the risks.",
                  style: TextStyle(fontSize: 15, color: AppColors.iconGrey),
                ),
              ],
            ),
          ),
          Gap(20),

          AppInkWell(
            onTap: () {
              setState(() {
                value = value!;
              });
            },
            child: Row(
              children: [
                Transform.scale(
                  scale: 1.4,
                  child: Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(5),
                    ),
                    value: value,
                    fillColor: MaterialStateProperty.resolveWith<Color>((
                      Set<MaterialState> states,
                    ) {
                      if (states.contains(MaterialState.selected)) {
                        return AppColors.buttonPink;
                      }

                      return AppColors.navGrey;
                    }),
                    side: BorderSide(color: AppColors.navBorder),
                    activeColor: AppColors.buttonPink,
                    onChanged: (val) {
                      setState(() {
                        value = val;
                      });
                    },
                  ),
                ),

                Expanded(
                  child: RichText(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      text: "Check this box to agree to Roqqu’s copy trading ",

                      style: header2.copyWith(fontSize: 12),
                      children: [
                        TextSpan(
                          text: "policy",
                          style: header2.copyWith(
                            color: AppColors.indicatorBlue,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Gap(20),
          Stack(
            children: [
              AppButton(
                stops: [0.00, 0.5, 1.0],
                color: [
                  AppColors.buttonGradient1.withValues(alpha: 0.6),
                  AppColors.buttonPurple,
                  AppColors.buttonGradient2,
                ],
                onTap: () {},
                text: "Proceed to copy trade",
              ),

              AppInkWell(
                onTap: () {
                  Navigator.pop(context);
                  AppRouter.pushDialog(RiskBottomSheet2());
                },
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.black.withValues(alpha: 0.6),
                  ),
                ),
              ),
            ],
          ),
          Gap(bottomPaddding),
        ],
      ),
    );
  }
}


/*   */