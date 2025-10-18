import 'package:flutter/material.dart';
import 'package:trading_app/theme/colors.dart';

class NameAbbrevationWidget extends StatelessWidget {
  final Color borderColor;
  final Color? bgColor;
  final String name;
  final bool showCopy;
  final bool showTag;

  const NameAbbrevationWidget({
    super.key,
    required this.borderColor,
    this.bgColor,
    this.showTag = true,
    this.showCopy = true,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: showCopy ? 38 : 56,
          width: showCopy ? 38 : 51,
          decoration: BoxDecoration(
            color: bgColor,
            border: Border.all(width: 0.64, color: borderColor),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              name,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ),

        if (showTag) ...[
          Positioned(
            bottom: -8,
            right: 4,
            child: Image.asset("assets/tag.png", height: showCopy ? 19 : 25),
          ),
        ],
      ],
    );
  }
}
