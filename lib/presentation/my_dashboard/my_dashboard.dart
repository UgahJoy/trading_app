import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/constants.dart';
import 'package:trading_app/presentation/my_dashboard/widget/my_dashboard_chart.dart';
import 'package:trading_app/presentation/my_dashboard/widget/my_dashboard_current_trades.dart';
import 'package:trading_app/presentation/my_dashboard/widget/my_dashboard_stats.dart';
import 'package:trading_app/presentation/my_dashboard/widget/my_dashboard_traders.dart';
import 'package:trading_app/presentation/my_dashboard/widget/net_profit.dart';
import 'package:trading_app/shared_widgets/app_bar_item.dart';
import 'package:trading_app/shared_widgets/app_scaffold.dart';
import 'package:trading_app/shared_widgets/trade_chart_selector.dart';
import 'package:trading_app/theme/colors.dart';

class MyDashboard extends ConsumerStatefulWidget {
  const MyDashboard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyDashboardState();
}

class _MyDashboardState extends ConsumerState<MyDashboard> {
  int currentIndex = 0;
  final _pageController = PageController();
  void _onPagChange(int index) {
    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
        _pageController.animateToPage(
          index,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeOutCirc,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        children: [
          Gap(topPadding),
          AppBarItem(text: "My dashboard"),

          Gap(30),
          NetProfit(),
          Gap(12),
          Container(
            decoration: BoxDecoration(
              color: AppColors.scaffoldBgColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              border: Border.all(color: AppColors.navBorder),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TradeChartsSelector(
                    text: "Chart",
                    currentIndex: currentIndex,
                    index: 0,
                    onTap: () {
                      _onPagChange(0);
                    },
                  ),
                ),
                Expanded(
                  child: TradeChartsSelector(
                    text: "Current trades",
                    currentIndex: currentIndex,
                    index: 1,
                    onTap: () {
                      _onPagChange(1);
                    },
                  ),
                ),
                Expanded(
                  child: TradeChartsSelector(
                    text: "Stats",
                    currentIndex: currentIndex,
                    index: 2,
                    onTap: () {
                      _onPagChange(2);
                    },
                  ),
                ),
                Expanded(
                  child: TradeChartsSelector(
                    text: "My traders",
                    currentIndex: currentIndex,
                    index: 3,
                    onTap: () {
                      _onPagChange(3);
                    },
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: PageView(
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              controller: _pageController,
              children: [
                MyDashboardChart(),
                MyDashboardCurrentTrades(),
                MyDashboardStats(),
                MyDashboardTraders(),
              ],
            ),
          ),

          // Expanded(child: MyDashboardBody()),
        ],
      ),
    );
  }
}
