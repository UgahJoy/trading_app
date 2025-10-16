import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/constants.dart';
import 'package:trading_app/presentation/home/widget/copy_trading_container.dart';
import 'package:trading_app/presentation/home/widget/currency_widget.dart';
import 'package:trading_app/presentation/home/widget/listed_coins_conatiner.dart';
import 'package:trading_app/presentation/home/widget/trade_actions.dart';
import 'package:trading_app/presentation/home/widget/update_indicator.dart';
import 'package:trading_app/presentation/home/widget/updates.dart';
import 'package:trading_app/theme/app_textstyle.dart';
import 'package:trading_app/theme/colors.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  int currentIndex = 0;
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.scaffoldBgColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenPaddding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(24),
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
              CurrencyWidget(),
              Gap(20),
              TradeActions(),

              Gap(28),
              CopyTradingContainer(),

              Gap(28),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Stay Updated",
                  style: header.copyWith(
                    color: AppColors.iconGrey,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              Gap(12),
              SizedBox(
                height: 90,
                child: ListView.builder(
                  reverse: true,
                  controller: controller,
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) => Updates(index: index),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  6,
                  (index) => UpdateIndicator(
                    onTap: () {
                      setState(() {
                        // controller.jumpTo(currentIndex);
                        currentIndex = index;
                      });
                    },
                    index: index,
                    currentIndex: currentIndex,
                  ),
                ),
              ),

              Gap(20),
              Row(
                children: [
                  Text(
                    "Listed Coins",
                    style: header.copyWith(
                      color: AppColors.iconGrey,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "See all",
                    style: TextStyle(
                      color: AppColors.indicatorBlue,
                      fontFamily: "Nexa",
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              Gap(8),
              ListedCoinsConatiner(),
              Gap(bottomPaddding),
            ],
          ),
        ),
      ),
    );
  }
}
