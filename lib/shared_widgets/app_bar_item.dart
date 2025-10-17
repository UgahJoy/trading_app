import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/shared_widgets/app_back_button.dart';
import 'package:trading_app/theme/app_textstyle.dart';

class AppBarItem extends StatelessWidget {
  final bool showBackArrow;
  final String text;
  const AppBarItem({super.key, required this.text, this.showBackArrow = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (showBackArrow) ...[AppBackButton()],
        Text(text, style: subHeader),
        Gap(20),
      ],
    );
  }
}
