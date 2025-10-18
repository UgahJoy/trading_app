import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/presentation/copy_trading/copy_trading_onboarding/widgets/progress_indicator.dart';
import 'package:trading_app/theme/app_textstyle.dart';
import 'package:trading_app/theme/colors.dart';

class OnboardingBody extends StatelessWidget {
  final String title;
  final String caption;
  final String image;
  final int currentIndex;
  final Function(int) onPageChanged;
  const OnboardingBody({
    super.key,
    required this.caption,
    required this.currentIndex,
    required this.image,
    required this.title,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Gap(40),

        Row(
          children: [
            Expanded(
              child: LinearIndicator(
                index: 0,
                currentIndex: currentIndex,
                onTap: () {
                  onPageChanged(0);
                },
              ),
            ),
            Gap(8),
            Expanded(
              child: LinearIndicator(
                index: 1,
                currentIndex: currentIndex,
                onTap: () {
                  onPageChanged(1);
                },
              ),
            ),
          ],
        ),
        Gap(28),

        FadeInLeft(child: Text(title, style: header)),
        Gap(4),
        FadeInUp(child: Text(caption)),

        Expanded(
          child: FadeInDown(child: Image.asset("assets/onboarding_$image.png")),
        ),
        Align(
          alignment: Alignment.center,
          child: FadeInRight(
            child: Text(
              "Watch a how to video",
              style: subHeader.copyWith(color: AppColors.indicatorBlue),
            ),
          ),
        ),
        Gap(32),
      ],
    );
  }
}
