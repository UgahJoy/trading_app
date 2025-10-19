import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:trading_app/helper_files/extensions.dart';
import 'package:trading_app/theme/colors.dart';

class AppLoader extends StatelessWidget {
  final double? height;
  const AppLoader({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height ?? context.deviceHeight * 0.1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadingAnimationWidget.stretchedDots(
            color: AppColors.primaryColor,
            size: 40,
          ),
        ],
      ),
    );
  }
}
