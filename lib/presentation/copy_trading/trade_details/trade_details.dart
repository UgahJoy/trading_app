import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/constants.dart';
import 'package:trading_app/models/pro_traders_model.dart';
import 'package:trading_app/presentation/copy_trading/trade_details/all_trade_history.dart';
import 'package:trading_app/presentation/copy_trading/trade_details/trade_copiers.dart';
import 'package:trading_app/presentation/copy_trading/trade_details/trading_details_chart.dart';
import 'package:trading_app/presentation/copy_trading/trade_details/widgets/trading_statistics.dart';
import 'package:trading_app/shared_widgets/app_bar_item.dart';
import 'package:trading_app/shared_widgets/bottom_nav.dart';
import 'package:trading_app/shared_widgets/trade_section_selector.dart';
import 'package:trading_app/presentation/copy_trading/trade_details/widgets/certified_pros.dart';
import 'package:trading_app/presentation/copy_trading/copy_trading_dashboard_picker/widgets/traders_name_widget.dart';
import 'package:trading_app/presentation/copy_trading/trade_details/widgets/trends.dart';
import 'package:trading_app/shared_widgets/app_scaffold.dart';
import 'package:trading_app/theme/colors.dart';

class TradeDetails extends ConsumerStatefulWidget {
  final ProTradersModel model;
  const TradeDetails({super.key, required this.model});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TradeDetailsState();
}

class _TradeDetailsState extends ConsumerState<TradeDetails> {
  int currentIndex = 0;
  final _pageController = PageController();

  void _onPageChange(int index) {
    setState(() {
      currentIndex = index;
      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOutCubicEmphasized,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      bottomNavigationBar: currentIndex == 0
          ? BottomNav(buttonText: "Copy trade", onTap: () {})
          : SizedBox(),
      body: Column(
        children: [
          Gap(topPadding),
          AppBarItem(text: "Trading details"),

          Gap(20),
          TradersNameWidget(
            showCopy: false,
            bgColor: AppColors.proTradersGreen,
            model: widget.model,
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
          CertifiedPros(),
          Gap(4),
          TradeSectionSelector(
            currentIndex: currentIndex,
            onChanged: (val) {
              _onPageChange(val);
            },
          ),
          Expanded(
            child: PageView(
              onPageChanged: (value) {
                setState(() {});
              },
              controller: _pageController,
              children: [
                TradingDetailsChart(),
                TradeingStatistics(),
                AllTradeHistory(model: widget.model),
                TradeCopiers(model: widget.model),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
