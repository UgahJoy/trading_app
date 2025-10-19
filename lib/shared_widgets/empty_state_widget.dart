import 'package:flutter/material.dart';
import 'package:trading_app/helper_files/extensions.dart';
import 'package:trading_app/theme/app_textstyle.dart';

class EmptyStateWidget extends StatelessWidget {
  final double? height;
  const EmptyStateWidget({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? context.deviceHeight * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign: TextAlign.center,
            "No Data Retrieved",
            style: header2,
          ),
        ],
      ),
    );
  }
}
