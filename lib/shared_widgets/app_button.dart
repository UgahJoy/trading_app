import 'package:flutter/material.dart';
import 'package:trading_app/shared_widgets/app_Inkwell.dart';
import 'package:trading_app/theme/colors.dart';

class AppButton extends StatefulWidget {
  final String text;
  final Function() onTap;
  final List<Color>? color;
  final List<double>? stops;
  final double? fontSize;
  final Color? buttonTextColor;
  const AppButton({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.buttonTextColor,
    this.stops,
    required this.onTap,
  });

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
            stops: widget.stops ?? [0.05, 0.6, 1.0],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors:
                widget.color ??
                [
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
              fontSize: widget.fontSize ?? 14,
              color: widget.buttonTextColor ?? AppColors.primaryColor,

              height: 1.4,
            ),
          ),
        ),
      ),
    );
  }
}
