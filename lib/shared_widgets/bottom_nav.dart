import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/constants.dart';
import 'package:trading_app/shared_widgets/app_button.dart';
import 'package:trading_app/theme/colors.dart';

class BottomNav extends StatelessWidget {
  final String buttonText;
  final Function() onTap;
  final double? horizontalPadding;
  const BottomNav({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.horizontalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.navGrey,
        border: Border(top: BorderSide(color: AppColors.navBorder)),
      ),
      padding: EdgeInsets.only(top: 16),

      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppButton(text: buttonText, onTap: onTap),
            Gap(bottomPaddding),
          ],
        ),
      ),
    );
  }
}
