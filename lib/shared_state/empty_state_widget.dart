import 'package:flutter/material.dart';
import 'package:trading_app/theme/app_textstyle.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("No Data Retrieved", style: header2);
  }
}
