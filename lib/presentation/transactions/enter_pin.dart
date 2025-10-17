import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/constants.dart';
import 'package:trading_app/shared_widgets/app_bar_item.dart';
import 'package:trading_app/shared_widgets/app_scaffold.dart';
import 'package:trading_app/theme/app_textstyle.dart';

class EnterPin extends StatefulWidget {
  const EnterPin({super.key});

  @override
  State<EnterPin> createState() => _EnterPinState();
}

class _EnterPinState extends State<EnterPin> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        children: [
          Gap(topPadding),
          AppBarItem(text: ""),

          Image.asset("assets/pin_lock.png", height: 32),

          Gap(bottomPaddding),
          Text("Confirm Transaction", style: header.copyWith(fontSize: 24)),
          Gap(8),
          Text(
            textAlign: TextAlign.center,
            "Input your 6 digit transaction PIN to confirm your transaction and authenticate your request",
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
