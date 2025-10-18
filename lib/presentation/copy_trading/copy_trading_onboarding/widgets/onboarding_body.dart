import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/theme/app_textstyle.dart';

class OnboardingBody extends StatelessWidget {
  final String title;
  final String caption;
  final String image;
  final int currentIndex;

  const OnboardingBody({
    super.key,
    required this.caption,
    required this.currentIndex,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Gap(28),

        currentIndex == 0
            ? FadeInLeft(child: Text(title, style: header))
            : FadeInRight(child: Text(title, style: header)),
        Gap(4),
        FadeInUp(child: Text(caption)),

        Expanded(
          child: FadeInDown(child: Image.asset("assets/onboarding_$image.png")),
        ),
      ],
    );
  }
}
