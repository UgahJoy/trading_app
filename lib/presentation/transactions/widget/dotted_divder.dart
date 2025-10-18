import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:trading_app/theme/colors.dart';

class DottedDivder extends StatelessWidget {
  const DottedDivder({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      options: CustomPathDottedBorderOptions(
        padding: const EdgeInsets.all(8),
        color: AppColors.primaryColor.withValues(alpha: 0.03),
        strokeWidth: 0.2,
        dashPattern: [10, 5],
        customPath: (size) => Path()
          ..moveTo(0, size.height)
          ..relativeLineTo(size.width, 0),
      ),
      child: SizedBox(width: double.infinity),
    );
  }
}
