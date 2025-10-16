import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/constants.dart';
import 'package:trading_app/presentation/dashboard/widget/country_selector.dart';
import 'package:trading_app/presentation/dashboard/widget/crypto.dart';
import 'package:trading_app/presentation/dashboard/widget/not_icon.dart';

class DashboardAppBar extends StatelessWidget {
  const DashboardAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SafeArea(
        child: Column(
          children: [
            Gap(topPadding),
            Row(
              children: [
                Crypto(),
                Spacer(),
                Image.asset("assets/search.png", height: 20),
                Gap(16),
                Image.asset("assets/head_phone.png", height: 20),
                Gap(16),
                NotIcon(),
                Gap(16),
                CountrySelector(),
              ],
            ),
            Gap(20),
          ],
        ),
      ),
    );
  }
}
