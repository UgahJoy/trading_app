import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/app_router.dart';
import 'package:trading_app/helper_files/constants.dart';
import 'package:trading_app/helper_files/helper_function.dart';
import 'package:trading_app/presentation/my_dashboard/my_dashboard.dart';
import 'package:trading_app/repositories/global_repository.dart';
import 'package:trading_app/shared_state/app_state.dart';
import 'package:trading_app/shared_widgets/app_bar_item.dart';
import 'package:trading_app/presentation/copy_trading/copy_trading_dashboard_picker/widgets/dashboard_options.dart';
import 'package:trading_app/presentation/copy_trading/copy_trading_dashboard_picker/widgets/pro_traders.dart';
import 'package:trading_app/shared_widgets/app_loader.dart';
import 'package:trading_app/shared_widgets/app_scaffold.dart';
import 'package:trading_app/shared_widgets/check_mark_indicator.dart';
import 'package:trading_app/theme/app_textstyle.dart';
import 'package:trading_app/theme/colors.dart';

class CopyTradeDashBoardPicker extends ConsumerStatefulWidget {
  const CopyTradeDashBoardPicker({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CopyTradeDashBoardPickerState();
}

class _CopyTradeDashBoardPickerState
    extends ConsumerState<CopyTradeDashBoardPicker> {
  bool isBusy = true;
  @override
  void initState() {
    isBusy = ref.read(appState).allProTraders.isEmpty;

    if (isBusy) {
      ref.read(globalRepository).fetchProTraders().then((val) {
        isBusy = false;
        if (mounted) {
          setState(() {});
        }
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var allProTraders = ref.watch(appState).allProTraders;
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
          Gap(24),
          Text(
            "PRO Traders",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: header2.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Gap(12),
          Expanded(
            child: isBusy
                ? AppLoader()
                : CheckMarkIndicator(
                    onRefresh: () async {
                      await ref.watch(globalRepository).fetchProTraders();
                    },
                    child: ListView.builder(
                      itemCount: allProTraders.length,

                      itemBuilder: (context, index) => ProTraders(
                        model: allProTraders[index],
                        bgColor: generateRandomColor(index),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
