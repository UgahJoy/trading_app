import 'package:flutter/material.dart';
import 'package:trading_app/shared_widgets/app_Inkwell.dart';
import 'package:trading_app/theme/colors.dart';

class AppButton extends StatefulWidget {
  final String text;
  final Function() onTap;
  final double? fontSize;
  final Color? buttonTextColor;
  final bool isEnabled;
  const AppButton({
    super.key,
    required this.text,

    this.fontSize,
    this.buttonTextColor,

    this.isEnabled = true,
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
            stops: widget.isEnabled ? [0.05, 0.6, 1.0] : [0.0, 0.5, 1.0],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: widget.isEnabled
                ? [
                    AppColors.buttonBlue,
                    AppColors.buttonPurple,
                    AppColors.buttonPink,
                  ]
                : [
                    AppColors.buttonGradient1.withValues(alpha: 0.2),
                    AppColors.buttonPurple.withValues(alpha: 0.2),
                    AppColors.buttonGradient2.withValues(alpha: 0.25),
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
