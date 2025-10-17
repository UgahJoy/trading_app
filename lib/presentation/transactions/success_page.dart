import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/app_router.dart';
import 'package:trading_app/helper_files/extensions.dart';
import 'package:trading_app/presentation/crypto_trading/crypto_trading_onboarding/widgets/bottom_nav.dart';
import 'package:trading_app/presentation/dashboard/dashboard.dart';
import 'package:trading_app/shared_widgets/app_scaffold.dart';
import 'package:trading_app/theme/app_textstyle.dart';
import 'package:trading_app/theme/colors.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      bottomNavigationBar: BottomNav(
        buttonText: "Go to dashboard",
        onTap: () => AppRouter.clearAllAndPush(Dashboard()),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset("assets/sucess.png", height: 89),
          ),
          Gap(context.deviceHeight * 0.04),
          Text(
            "Trade copied successfully",
            style: header2.copyWith(fontSize: 16),
          ),
          Gap(8),
          Text(
            textAlign: TextAlign.center,
            "You have successfully copied BTC\nMaster’s trade.",
            style: TextStyle(fontSize: 15, color: AppColors.iconGrey),
          ),
        ],
      ),
    );
  }
}
