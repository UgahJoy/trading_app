import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/extensions.dart';
import 'package:trading_app/presentation/crypto_trading/trade_details/widgets/trade_history_selector.dart';
import 'package:trading_app/shared_widgets/filter_item.dart';
import 'package:trading_app/shared_widgets/trade_history_widget.dart';
import 'package:trading_app/theme/colors.dart';

class AllTradeHistory extends StatefulWidget {
  const AllTradeHistory({super.key});

  @override
  State<AllTradeHistory> createState() => _AllTradeHistoryState();
}

class _AllTradeHistoryState extends State<AllTradeHistory> {
  int currentIndex = 0;
  final _pageController = PageController();
  void _onPageChanged(int index) {
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
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.navBorder),
          right: BorderSide(color: AppColors.navBorder),
          left: BorderSide(color: AppColors.navBorder),
        ),
        color: AppColors.navGrey,
      ),
      child: Column(
        children: [
          Row(
            children: [
              TradeHistorySelector(
                currentIndex: currentIndex,
                onTap: (val) {
                  _onPageChanged(val);
                },
              ),
              Spacer(),
              Opacity(opacity: currentIndex == 0 ? 0 : 1, child: FilterItem()),
            ],
          ),

          Expanded(
            child: PageView(
              onPageChanged: (value) {
                setState(() {});
              },
              controller: _pageController,
              children: [
                TradeHistoryBody(),
                TradeHistoryWidget(isTradeHistory: true),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TradeHistoryBody extends StatelessWidget {
  const TradeHistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: context.deviceHeight,
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),

              itemCount: 14,
              itemBuilder: (context, index) =>
                  TradeHistoryWidget(isTradeHistory: true),
            ),
          ),

          Gap(context.deviceHeight * 0.1),
        ],
      ),
    );
  }
}
