// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trading_app/presentation/crypto_trading/trading_dashboard/trading_dashboard.dart';
import 'package:trading_app/presentation/dashboard/widget/app_nav_bar.dart';
import 'package:trading_app/presentation/dashboard/widget/dashboard_app_bar.dart';
import 'package:trading_app/presentation/home/home.dart';
import 'package:trading_app/presentation/my_dashboard/my_dashboard.dart';
import 'package:trading_app/shared_widgets/app_scaffold.dart';
import 'package:trading_app/theme/colors.dart';

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {
  int currentIndex = 0;
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: AppScaffold(
        bottomNavigationBar: AppNavBar(
          currentIndex: currentIndex,
          onPageChanged: (val) {
            if (val != currentIndex) {
              _pageController.animateToPage(
                val,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            }
          },
        ),
        horizontalScreenPadding: 0,
        top: false,
        bottom: false,

        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              stops: [0.05, 0.6, 1.0],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                AppColors.dashboardGradient1,
                AppColors.dashboardGradient2,
                AppColors.dashboardGradient3,
              ],
            ),
          ),
          child: Column(
            children: [
              const DashboardAppBar(),
              Expanded(
                child: PageView(
                  onPageChanged: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                  controller: _pageController,
                  children: [Home(), MyDashboard(), TradingDashboard()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
