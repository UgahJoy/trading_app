import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/all_traders_details_datum.dart';
import 'package:trading_app/helper_files/app_router.dart';
import 'package:trading_app/helper_files/constants.dart';
import 'package:trading_app/presentation/my_dashboard/my_dashboard.dart';
import 'package:trading_app/shared_widgets/app_bar_item.dart';
import 'package:trading_app/presentation/crypto_trading/trading_dashboard/widgets/dashboard_options.dart';
import 'package:trading_app/presentation/crypto_trading/trading_dashboard/widgets/pro_traders.dart';
import 'package:trading_app/shared_widgets/app_scaffold.dart';
import 'package:trading_app/theme/app_textstyle.dart';
import 'package:trading_app/theme/colors.dart';

class TradingDashboard extends ConsumerStatefulWidget {
  const TradingDashboard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TradingDashboardState();
}

class _TradingDashboardState extends ConsumerState<TradingDashboard> {
  List<AllTradersDetailsDaTum> data = [
    AllTradersDetailsDaTum(
      bgColor: AppColors.proTradersBlue1,
      color: AppColors.proTradersBlue,
      name: "Jay isisou",
    ),
    AllTradersDetailsDaTum(
      bgColor: AppColors.proTradersYellow,
      name: "Laura okobi",
      color: AppColors.proTradersYellow,
    ),
    AllTradersDetailsDaTum(
      bgColor: AppColors.proTradersGreen,
      name: "BTC master",
      color: AppColors.proTradersGreen,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(topPadding),
          AppBarItem(text: "Copy trading"),
          Gap(topPadding),
          Row(
            children: [
              Expanded(
                child: DashboardOptions(
                  colors2: [
                    AppColors.tradingGradient1.withValues(alpha: 0.8),
                    AppColors.tradingGradient2,
                    AppColors.tradingGradient3,
                  ],
                  caption: "View trades",
                  colors: [
                    AppColors.tradingGradient1,
                    AppColors.tradingGradient2,
                    AppColors.tradingGradient3,
                  ],
                  image: "assets/my_dashboard.png",
                  onTap: () => AppRouter.navigateTo(MyDashboard()),
                  title: "My dashboard",
                ),
              ),
              Gap(16),
              Expanded(
                child: DashboardOptions(
                  caption: "Apply Now",

                  colors: [
                    AppColors.tradingDashboardGradient1,
                    AppColors.tradingDashboardGradient2,
                    AppColors.tradingDashboardGradient3,
                  ],
                  image: "assets/pro_dashboard.png",
                  onTap: () {},
                  title: "Become a PRO trader",
                ),
              ),
            ],
          ),
          Gap(topPadding),
          Text(
            "PRO Traders",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: header2.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Gap(12),
          Expanded(
            child: ListView.builder(
              itemCount: 3,

              itemBuilder: (context, index) => ProTraders(
                name: data[index].name,
                bgColor: data[index].bgColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
