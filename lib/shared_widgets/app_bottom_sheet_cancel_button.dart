import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/shared_widgets/app_Inkwell.dart';
import 'package:trading_app/theme/colors.dart';

class AppBottomSheetCancelButton extends StatelessWidget {
  const AppBottomSheetCancelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Gap(12),
        Align(
          alignment: AlignmentGeometry.center,
          child: Container(
            height: 5,
            width: 38,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.indicatorGrey,
            ),
          ),
        ),

        AppInkWell(
          onTap: () => Navigator.pop(context),
          child: Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              color: AppColors.navGrey,
              shape: BoxShape.circle,
            ),
            child: Center(child: Image.asset("assets/close.png", height: 10)),
          ),
        ),
      ],
    );
  }
}
