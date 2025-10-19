// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/app_router.dart';
import 'package:trading_app/presentation/copy_trading/trading_details/widgets/risk_bottom_sheet.dart';
import 'package:trading_app/shared_widgets/app_Inkwell.dart';
import 'package:trading_app/shared_widgets/app_alert.dart';
import 'package:trading_app/shared_widgets/app_bottom_sheet_cancel_button.dart';
import 'package:trading_app/shared_widgets/app_button.dart';
import 'package:trading_app/theme/app_textstyle.dart';
import 'package:trading_app/theme/colors.dart';

class DisclamerBottomSheet extends StatefulWidget {
  const DisclamerBottomSheet({super.key});

  @override
  State<DisclamerBottomSheet> createState() => _DisclamerBottomSheetState();
}

class _DisclamerBottomSheetState extends State<DisclamerBottomSheet> {
  bool? value = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
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
          Gap(10),
          Text("Important message!", style: header.copyWith(fontSize: 18)),
          Gap(10),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text:
                  "Don’t invest unless you’re prepared and\nunderstand the risks involved in copy trading. ",
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
                value = !value!;
              });
            },
            child: Row(
              children: [
                Transform.scale(
                  scale: 1.1,
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

                      style: header2.copyWith(fontSize: 11),
                      children: [
                        TextSpan(
                          text: "policy",
                          style: header2.copyWith(
                            color: AppColors.indicatorBlue,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Gap(8),
          AppButton(
            fontSize: 13,
            buttonTextColor: AppColors.primaryColor.withValues(alpha: 0.6),
            stops: [0.0, 0.5, 1.0],
            color: [
              AppColors.buttonGradient1.withValues(alpha: 0.2),
              AppColors.buttonPurple.withValues(alpha: 0.2),
              AppColors.buttonGradient2.withValues(alpha: 0.25),
            ],
            onTap: () {
              if (value == false) {
                AppAlerts.showError(
                  "Please agree to Roqqu’s copy trading policy to continue.",
                );
                return;
              } else {
                Navigator.pop(context);
                AppRouter.pushDialog(RiskBottomSheet());
              }
            },
            text: "Proceed to copy trade",
          ),
          Gap(40),
        ],
      ),
    );
  }
}


/*   */