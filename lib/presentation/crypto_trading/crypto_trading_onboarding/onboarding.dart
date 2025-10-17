import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/app_router.dart';
import 'package:trading_app/helper_files/constants.dart';
import 'package:trading_app/presentation/crypto_trading/crypto_trading_onboarding/risk_level.dart';
import 'package:trading_app/presentation/crypto_trading/crypto_trading_onboarding/widgets/bottom_nav.dart';
import 'package:trading_app/shared_widgets/app_bar_item.dart';
import 'package:trading_app/presentation/crypto_trading/crypto_trading_onboarding/widgets/onboarding_body.dart';
import 'package:trading_app/shared_widgets/app_scaffold.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
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

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      bottomNavigationBar: BottomNav(
        buttonText: "Get started",
        onTap: () => AppRouter.navigateTo(RiskLevel()),
      ),
      body: Column(
        children: [
          Gap(topPadding),

          AppBarItem(text: "Copy trading"),
          Expanded(
            child: PageView.builder(
              itemCount: data.length,
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              itemBuilder: (context, index) => OnboardingBody(
                title: data[index].title,
                caption: data[index].caption,
                image: data[index].image,
                currentIndex: currentIndex,
                onPageChanged: (index) {
                  _pageController.animateToPage(
                    index,
                    duration: Duration(milliseconds: 1200),
                    curve: Curves.easeOut,
                  );
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void initAnimation() {
    if (!mounted) {
      return;
    }
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      if (currentIndex < 1) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }
      _pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 250),
        curve: Curves.fastEaseInToSlowEaseOut,
      );
    });
  }
}

class DataTum {
  final String title;
  final String caption;
  final String image;
  DataTum({required this.caption, required this.image, required this.title});
}
