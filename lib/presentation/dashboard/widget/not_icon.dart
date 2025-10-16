import 'package:flutter/material.dart';
import 'package:trading_app/theme/colors.dart';

class NotIcon extends StatelessWidget {
  const NotIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/not_icon.png", height: 20),
        Positioned(
          right: 0,
          child: Container(
            height: 8,
            width: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryColor,
            ),
            child: Center(
              child: Container(
                height: 6,
                width: 6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.red,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
