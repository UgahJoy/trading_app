import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/shared_widgets/filter_item.dart';
import 'package:trading_app/theme/app_textstyle.dart';

class FilterWidget extends StatelessWidget {
  final String text;

  const FilterWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: header2.copyWith(fontSize: 12),
          ),
        ),
        Gap(20),
        FilterItem(),
      ],
    );
  }
}
