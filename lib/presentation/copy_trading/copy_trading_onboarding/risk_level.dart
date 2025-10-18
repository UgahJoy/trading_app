import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/app_router.dart';
import 'package:trading_app/helper_files/constants.dart';
import 'package:trading_app/shared_widgets/app_bar_item.dart';
import 'package:trading_app/presentation/copy_trading/copy_trading_dashboard_picker/copy_trading_dashboard_picker.dart';
import 'package:trading_app/presentation/copy_trading/copy_trading_onboarding/widgets/bottom_nav.dart';
import 'package:trading_app/presentation/copy_trading/copy_trading_onboarding/widgets/risk_levels_selectors.dart';
import 'package:trading_app/shared_widgets/app_scaffold.dart';
import 'package:trading_app/theme/app_textstyle.dart';

class RiskLevel extends StatefulWidget {
  const RiskLevel({super.key});

  @override
  State<RiskLevel> createState() => _RiskLevelState();
}

class _RiskLevelState extends State<RiskLevel> {
  int currentIndex = 0;
  List<DataTum> riskLevelSelector = [
    DataTum(
      body:
          "Conservative profile involves stable returns from proven strategies with minimal volatility.",
      title: "Conservative profile",
    ),
    DataTum(
      body:
          "Steady growth involves balanced gains with moderate fluctuations in strategy performance.",
      title: "Steady growth profile",
    ),

    DataTum(
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
        onTap: () => AppRouter.navigateTo(CopyTradeDashBoardPicker()),
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
              itemBuilder: (context, index) => RiskLevelSelector(
                body: riskLevelSelector[index].body,
                title: riskLevelSelector[index].title,
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

class DataTum {
  final String title;
  final String body;
  DataTum({required this.body, required this.title});
}
