import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/app_router.dart';
import 'package:trading_app/helper_files/constants.dart';
import 'package:trading_app/presentation/crypto_trading/crypto_trading_onboarding/widgets/bottom_nav.dart';
import 'package:trading_app/shared_widgets/app_bar_item.dart';
import 'package:trading_app/presentation/crypto_trading/trade_details/widgets/trading_details.dart';
import 'package:trading_app/presentation/crypto_trading/trade_details/widgets/allocation_item.dart';
import 'package:trading_app/presentation/crypto_trading/trade_details/widgets/certified_pros.dart';
import 'package:trading_app/presentation/crypto_trading/trade_details/widgets/holding_period_item.dart';
import 'package:trading_app/presentation/crypto_trading/trade_details/widgets/risk_bottom_sheet.dart';
import 'package:trading_app/presentation/crypto_trading/trading_dashboard/widgets/traders_name_widget.dart';
import 'package:trading_app/presentation/crypto_trading/trade_details/widgets/trends.dart';
import 'package:trading_app/shared_widgets/app_scaffold.dart';
import 'package:trading_app/theme/colors.dart';

class TradeDetails extends ConsumerStatefulWidget {
  const TradeDetails({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TradeDetailsState();
}

class _TradeDetailsState extends ConsumerState<TradeDetails> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      bottomNavigationBar: BottomNav(
        buttonText: "Copy trade",
        onTap: () {
          AppRouter.pushDialog(RiskBottomSheet());
        },
      ),
      body: Column(
        children: [
          Gap(topPadding),
          AppBarItem(text: "Trading details"),

          Gap(20),
          TradersNameWidget(
            showCopy: false,
            bgColor: AppColors.proTradersGreen,
            name: "BTC master",
            color: AppColors.proTradersGreen,
          ),
          Gap(12),
          Row(
            children: [
              Expanded(child: Trends(text: "43 trading days")),
              Expanded(child: Trends(text: "15% profit-share")),
              Expanded(child: Trends(text: "56 total orders")),
            ],
          ),
          Gap(12),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CertifiedPros(),
                  Gap(4),
                  TradingDetailsChart(
                    currentIndex: currentIndex,
                    onChanged: (val) {
                      currentIndex = val;
                      setState(() {});
                    },
                  ),
                  Gap(8),
                  AllocationItem(),

                  Gap(8),
                  HoldingPeriodItem(),
                  Gap(bottomPaddding),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
