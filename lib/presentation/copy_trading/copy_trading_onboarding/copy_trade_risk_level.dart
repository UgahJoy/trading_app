import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/all_datums.dart';
import 'package:trading_app/helper_files/app_router.dart';
import 'package:trading_app/helper_files/constants.dart';
import 'package:trading_app/shared_widgets/app_bar_item.dart';
import 'package:trading_app/presentation/copy_trading/copy_trading_dashboard_selector/copy_trading_dashboard_choice_selector.dart';
import 'package:trading_app/presentation/copy_trading/copy_trading_onboarding/widgets/cop_trading_risk_levels_selectors.dart';
import 'package:trading_app/shared_widgets/app_scaffold.dart';
import 'package:trading_app/shared_widgets/bottom_nav.dart';
import 'package:trading_app/theme/app_textstyle.dart';

class CopyTradeRiskLevel extends StatefulWidget {
  const CopyTradeRiskLevel({super.key});

  @override
  State<CopyTradeRiskLevel> createState() => _CopyTradeRiskLevelState();
}

class _CopyTradeRiskLevelState extends State<CopyTradeRiskLevel> {
  int currentIndex = 0;
  List<CopyTradeRiskLevelDataTum> riskLevelSelector = [
    CopyTradeRiskLevelDataTum(
      body:
          "Conservative profile involves stable returns from proven strategies with minimal volatility.",
      title: "Conservative profile",
    ),
    CopyTradeRiskLevelDataTum(
      body:
          "Steady growth involves balanced gains with moderate fluctuations in strategy performance.",
      title: "Steady growth profile",
    ),

    CopyTradeRiskLevelDataTum(
      body:
          "It has potentials for significant gains or losses due to aggressive trading and market exposure.",
      title: "Exponential growth profile",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      bottomNavigationBar: BottomNav(
        buttonText: "Proceed",
        onTap: () => AppRouter.navigateTo(CopyTradeDashBoardChoiceSelector()),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(topPadding),

          AppBarItem(text: "Copy trading"),
          Gap(40),
          Text("What risk level are you comfortable exploring?", style: header),
          Gap(8),
          Text("Choose a level"),
          Gap(20),
          Expanded(
            child: ListView.builder(
              itemCount: riskLevelSelector.length,
              itemBuilder: (context, index) => CopyTradeRiskLevelSelectors(
                model: riskLevelSelector[index],
                index: index,
                onTap: () {
                  setState(() {
                    currentIndex = index;
                  });
                },
                currentIndex: currentIndex,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
