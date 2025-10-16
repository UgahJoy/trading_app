import 'package:flutter/material.dart';
import 'package:trading_app/theme/app_textstyle.dart';

class CurrencyWidget extends StatelessWidget {
  const CurrencyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "£0",
        style: header.copyWith(fontSize: 32, height: 1.25),
        children: [
          TextSpan(
            text: ".00",
            style: header.copyWith(fontSize: 12, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
