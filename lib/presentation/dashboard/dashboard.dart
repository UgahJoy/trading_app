import 'dart:ui';

import 'package:animate_icons/animate_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trading_app/presentation/copy_trading/copy_trading_dashboard_picker/copy_trading_dashboard_picker.dart';
import 'package:trading_app/presentation/dashboard/widget/app_nav_bar.dart';
import 'package:trading_app/presentation/dashboard/widget/dashboard_app_bar.dart';
import 'package:trading_app/presentation/home/home.dart';
import 'package:trading_app/presentation/home/widget/trade_menu.dart';
import 'package:trading_app/shared_widgets/app_scaffold.dart';
import 'package:trading_app/theme/colors.dart';

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  bool isOpned = false;
  final AnimateIconController menuAnimationController = AnimateIconController();
  late AnimationController _controller;
  final PageController _pageController = PageController();

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: AppScaffold(
        bottomNavigationBar: AppNavBar(
          menuController: menuAnimationController,
          menuStateChanged: (val) {
            isOpned = val;
            if (isOpned) {
              _controller.forward();
            } else {
              _controller.reverse();
            }
            setState(() {});
          },
          currentIndex: currentIndex,
          onPageChanged: (val) {
            if (val != currentIndex) {
              _pageController.animateToPage(
                val,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOutCubicEmphasized,
              );
            }
          },
        ),
        horizontalScreenPadding: 0,
        top: false,
        bottom: false,

        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
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
                      children: [Home(), CopyTradeDashBoardPicker()],
                    ),
                  ),
                ],
              ),
            ),
            if (isOpned) ...[
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  final double sigma = 5 * _controller.value;
                  final double barrierOpacity = 0.4 * _controller.value;

                  return Positioned.fill(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
                      child: Container(
                        color: AppColors.black.withValues(
                          alpha: barrierOpacity,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],

            Positioned(
              left: isOpned ? 12 : 0,
              right: isOpned ? 12 : 0,
              bottom: isOpned ? 10 : 0,
              child: TradeMenu(
                onClose: (val, val2) {
                  menuAnimationController.animateToStart();
                  _controller.reverse();
                  isOpned = false;
                  setState(() {});
                  Future.delayed(Duration(milliseconds: 350), () {
                    val2();
                  });
                },
                isOpned: isOpned,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
