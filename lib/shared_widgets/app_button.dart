import 'package:flutter/material.dart';
import 'package:trading_app/shared_widgets/app_Inkwell.dart';
import 'package:trading_app/theme/colors.dart';

class AppButton extends StatefulWidget {
  final String text;
  final Function() onTap;
  const AppButton({super.key, required this.text, required this.onTap});

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return AppInkWell(
      onTap: widget.onTap,
      child: Container(
        height: 48,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),

          gradient: LinearGradient(
            stops: [0.05, 0.6, 1.0],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              AppColors.buttonBlue,
              AppColors.buttonPurple,
              AppColors.buttonPink,
            ],
          ),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.primaryColor,
              fontFamily: "Inter",
              fontWeight: FontWeight.w400,
              height: 1.4,
            ),
          ),
        ),
      ),
    );
  }
}
