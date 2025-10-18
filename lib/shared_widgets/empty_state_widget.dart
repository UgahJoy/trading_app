import 'package:flutter/material.dart';
import 'package:trading_app/helper_files/extensions.dart';
import 'package:trading_app/theme/app_textstyle.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.deviceHeight,
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
