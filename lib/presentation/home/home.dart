import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/constants.dart';
import 'package:trading_app/presentation/home/widget/copy_trading_widget.dart';
import 'package:trading_app/presentation/home/widget/account_balance_widget.dart';
import 'package:trading_app/presentation/home/widget/all_coins_list.dart';
import 'package:trading_app/presentation/home/widget/trade_actions.dart';
import 'package:trading_app/presentation/home/widget/stay_updated_widget.dart';
import 'package:trading_app/repositories/global_repository.dart';
import 'package:trading_app/shared_widgets/check_mark_indicator.dart';
import 'package:trading_app/theme/colors.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  int currentIndex = 0;

  final scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      padding: EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        color: AppColors.scaffoldBgColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: CheckMarkIndicator(
        onRefresh: () async {
          await ref.read(globalRepository).fetchAllCoins();
        },
        child: Column(
          children: [
            AnimatedBalanceWidget(scrollController: scrollController),

            Expanded(
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Gap(8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Your GBP Balance"),
                        Gap(4),
                        Padding(
                          padding: const EdgeInsets.only(top: 3.0),
                          child: Image.asset("assets/eye.png", height: 14),
                        ),
                      ],
                    ),
                    Gap(12),
                    AccountBalanceWidget(),
                    Gap(20),
                    TradeActions(),

                    CopyTradingWidget(),

                    StayUpdatedWidget(),

                    AllCoinList(),
                    Gap(bottomPaddding),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
