import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/extensions.dart';
import 'package:trading_app/presentation/crypto_trading/trade_details/widgets/chart_selector.dart';
import 'package:trading_app/presentation/my_dashboard/widget/my_dashboard_chart.dart';
import 'package:trading_app/presentation/my_dashboard/widget/my_dashboard_current_trades.dart';
import 'package:trading_app/presentation/my_dashboard/widget/my_dashboard_stats.dart';
import 'package:trading_app/presentation/my_dashboard/widget/my_dashboard_traders.dart';
import 'package:trading_app/theme/colors.dart';

class MyDashboardBody extends StatefulWidget {
  const MyDashboardBody({super.key});

  @override
  State<MyDashboardBody> createState() => _MyDashboardBodyState();
}

class _MyDashboardBodyState extends State<MyDashboardBody> {
  final _pageController = PageController();
  int currentIndex = 0;
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
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.scaffoldBgColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            border: Border.all(color: AppColors.navBorder),
          ),
          child: Row(
            children: [
              Expanded(
                child: ChartsSelector(
                  text: "Chart",
                  currentIndex: currentIndex,
                  index: 0,
                  onTap: () {
                    _onPagChange(0);
                  },
                ),
              ),
              Expanded(
                child: ChartsSelector(
                  text: "Current trades",
                  currentIndex: currentIndex,
                  index: 1,
                  onTap: () {
                    _onPagChange(1);
                  },
                ),
              ),
              Expanded(
                child: ChartsSelector(
                  text: "Stats",
                  currentIndex: currentIndex,
                  index: 2,
                  onTap: () {
                    _onPagChange(2);
                  },
                ),
              ),
              Expanded(
                child: ChartsSelector(
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

        SizedBox(
          height: context.deviceHeight,
          child: PageView(
            controller: _pageController,
            onPageChanged: (val) {
              setState(() {
                currentIndex = val;
              });
            },

            children: [
              MyDashboardChart(),
              MyDashboardCurrentTrades(),
              MyDashboardStats(),
              MyDashboardTraders(),
            ],
          ),
        ),
        Gap(context.deviceHeight * 0.1),
      ],
    );
  }
}
