import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/app_router.dart';
import 'package:trading_app/helper_files/constants.dart';
import 'package:trading_app/presentation/copy_trading/copy_trading_onboarding/copy_trade_risk_level.dart';
import 'package:trading_app/presentation/copy_trading/copy_trading_onboarding/widgets/bottom_nav.dart';
import 'package:trading_app/presentation/copy_trading/copy_trading_onboarding/widgets/progress_indicator.dart';
import 'package:trading_app/shared_widgets/app_bar_item.dart';
import 'package:trading_app/shared_widgets/app_scaffold.dart';
import 'package:trading_app/theme/app_textstyle.dart';
import 'package:trading_app/theme/colors.dart';

class CopyTradeOnboarding extends StatefulWidget {
  const CopyTradeOnboarding({super.key});

  @override
  State<CopyTradeOnboarding> createState() => _CopyTradeOnboardingState();
}

class _CopyTradeOnboardingState extends State<CopyTradeOnboarding> {
  final PageController _pageController = PageController();
  late Timer _timer;
  List<DataTum> data = [
    DataTum(
      caption:
          "Leverage expert strategies from professional traders to boost your trading results.",
      title: "Copy PRO traders",
      image: "1",
    ),
    DataTum(
      caption:
          "Streamline your approach to trading and increase your winning potential effortlessly.",
      title: "Do less, Win more",
      image: "2",
    ),
  ];
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    initAnimation();
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChange(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 1200),
      curve: Curves.easeOut,
    );
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      bottomNavigationBar: BottomNav(
        buttonText: "Get started",
        onTap: () => AppRouter.navigateTo(CopyTradeRiskLevel()),
      ),
      body: Column(
        children: [
          Gap(topPadding),
          AppBarItem(text: "Copy trading"),
          Gap(40),

          Row(
            children: [
              Expanded(
                child: LinearIndicator(
                  index: 0,
                  currentIndex: currentIndex,
                  onTap: () {
                    _onPageChange(0);
                  },
                ),
              ),
              Gap(8),
              Expanded(
                child: LinearIndicator(
                  index: 1,
                  currentIndex: currentIndex,
                  onTap: () {
                    _onPageChange(1);
                  },
                ),
              ),
            ],
          ),

          Expanded(
            child: PageView.builder(
              itemCount: data.length,
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              itemBuilder: (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Gap(28),

                  currentIndex == 0
                      ? FadeInLeft(
                          child: Text(data[index].title, style: header),
                        )
                      : FadeInRight(
                          child: Text(data[index].title, style: header),
                        ),
                  Gap(4),
                  FadeInUp(child: Text(data[index].caption)),

                  Expanded(
                    child: FadeInDown(
                      child: Image.asset(
                        "assets/onboarding_${data[index].image}.png",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Watch a how to video",
              style: subHeader.copyWith(color: AppColors.indicatorBlue),
            ),
          ),
          Gap(32),
        ],
      ),
    );
  }

  void initAnimation() {
    if (!mounted) {
      return;
    }
    _timer = Timer.periodic(Duration(milliseconds: 2500), (timer) {
      if (currentIndex < 1) {
        currentIndex++;
      } else {
        _timer.cancel();
      }
      _pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastEaseInToSlowEaseOut,
      );
      setState(() {});
    });
  }
}

class DataTum {
  final String title;
  final String caption;
  final String image;
  DataTum({required this.caption, required this.image, required this.title});
}
