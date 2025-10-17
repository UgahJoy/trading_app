import 'package:flutter/material.dart';
import 'package:trading_app/shared_widgets/app_InkWell.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppInkWell(
      onTap: () => Navigator.pop(context),
      child: Image.asset("assets/back_arrow.png", height: 20),
    );
  }
}
