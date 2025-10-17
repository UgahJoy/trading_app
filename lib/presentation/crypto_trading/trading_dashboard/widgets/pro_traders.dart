import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/app_router.dart';
import 'package:trading_app/presentation/crypto_trading/trade_details/trade_details.dart';
import 'package:trading_app/presentation/crypto_trading/trading_dashboard/widgets/trade_chart_item.dart';
import 'package:trading_app/presentation/crypto_trading/trading_dashboard/widgets/traders_name_widget.dart';
import 'package:trading_app/presentation/crypto_trading/trading_dashboard/widgets/win_rate_iem.dart';
import 'package:trading_app/shared_widgets/app_Inkwell.dart';
import 'package:trading_app/theme/colors.dart';

class ProTraders extends StatelessWidget {
  final String name;

  final Color bgColor;
  const ProTraders({super.key, required this.bgColor, required this.name});

  @override
  Widget build(BuildContext context) {
    return AppInkWell(
      onTap: () => AppRouter.navigateTo(TradeDetails()),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
              color: AppColors.navGrey,
              border: Border.all(color: AppColors.navBorder),
              borderRadius: BorderRadius.circular(16),
            ),
            // AppColors.proTradersBlue1
            child: Column(
              children: [
                TradersNameWidget(name: name, bgColor: bgColor, color: bgColor),
                TradeChartItem(),
                Divider(),
              ],
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 68,
            child: Container(
              margin: EdgeInsets.only(bottom: 20),

              decoration: BoxDecoration(
                color: AppColors.scaffoldBgColor,
                border: Border(
                  right: BorderSide(color: AppColors.navBorder),
                  left: BorderSide(color: AppColors.navBorder),
                  bottom: BorderSide(color: AppColors.navBorder),
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Column(children: [Gap(14), WinRateIem()]),
            ),
          ),
        ],
      ),
    );
  }
}
