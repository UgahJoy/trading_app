import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/app_router.dart';
import 'package:trading_app/helper_files/constants.dart';
import 'package:trading_app/presentation/transactions/enter_pin.dart';
import 'package:trading_app/presentation/transactions/widget/dotted_divder.dart';
import 'package:trading_app/shared_widgets/app_bar_item.dart';
import 'package:trading_app/shared_widgets/app_scaffold.dart';
import 'package:trading_app/shared_widgets/bottom_nav.dart';
import 'package:trading_app/theme/app_textstyle.dart';
import 'package:trading_app/theme/colors.dart';

class ConfrimTransaction extends StatefulWidget {
  const ConfrimTransaction({super.key});

  @override
  State<ConfrimTransaction> createState() => _ConfrimTransactionState();
}

class _ConfrimTransactionState extends State<ConfrimTransaction> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      bottomNavigationBar: BottomNav(
        buttonText: "Confirm transaction",
        onTap: () => AppRouter.navigateTo(EnterPin()),
      ),
      body: Column(
        children: [
          Gap(topPadding),
          AppBarItem(text: "Confirm transaction"),

          Gap(40),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 8,
              vertical: screenPaddding,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.navGrey,
              border: Border.all(color: AppColors.navBorder),
            ),
            child: Column(
              children: [
                Image.asset("assets/us_flag.png", height: 56),
                Gap(12),
                Text("Copy trading amount"),
                Gap(4),
                Text("100 USD", style: header),

                Gap(20),
                TranxDetails(title: "PRO trader", value: "BTC master"),
                Gap(24),
                TranxDetails(title: "What you get", value: "99 USD"),
                Gap(4),
                DottedDivder(),
                Gap(24),
                TranxDetails(title: "Transaction fee", value: "100 USD"),
                //
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TranxDetails extends StatelessWidget {
  final String title;
  final String value;

  const TranxDetails({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(title, style: TextStyle(color: AppColors.iconGrey)),
          ),

          Text(value, style: TextStyle(color: AppColors.primaryColor)),
        ],
      ),
    );
  }
}
