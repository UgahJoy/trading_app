import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/constants.dart';
import 'package:trading_app/helper_files/extensions.dart';
import 'package:trading_app/presentation/copy_trading/trading_details/widgets/allocation_item.dart';
import 'package:trading_app/repositories/global_repository.dart';
import 'package:trading_app/shared_state/app_state.dart';
import 'package:trading_app/shared_widgets/app_loader.dart';
import 'package:trading_app/shared_widgets/check_mark_indicator.dart';
import 'package:trading_app/shared_widgets/empty_state_widget.dart';
import 'package:trading_app/shared_widgets/filter_widget.dart';
import 'package:trading_app/presentation/copy_trading/trading_details/widgets/holding_period_item.dart';
import 'package:trading_app/shared_widgets/app_border_container.dart';
import 'package:trading_app/shared_widgets/app_chart_widget.dart';
import 'package:trading_app/theme/colors.dart';

class TradingDetailsChart extends ConsumerStatefulWidget {
  const TradingDetailsChart({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TradingDetailsChartState();
}

class _TradingDetailsChartState extends ConsumerState<TradingDetailsChart> {
  bool isBusy = true;
  @override
  void initState() {
    isBusy = ref.read(appState).rioGraph.isEmpty;
    if (isBusy) {
      ref.read(globalRepository).fetchRioGraphDetails().then((val) {
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
    var rioSpots = ref.watch(appState).rioGraph;
    return CheckMarkIndicator(
      onRefresh: () async {
        await ref.watch(globalRepository).fetchRioGraphDetails();
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.navBorder),
                color: AppColors.navGrey,
              ),
              child: Column(
                children: [
                  Gap(20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenPaddding),
                    child: FilterWidget(text: "RIO"),
                  ),
                  isBusy
                      ? AppLoader()
                      : rioSpots.isEmpty
                      ? EmptyStateWidget()
                      : AppChartItem(
                          valueSpots: rioSpots
                              .map(
                                (e) => FlSpot(
                                  (e.dataType ?? "").toDouble(),
                                  (e.value ?? 0),
                                ),
                              )
                              .toList(),
                        ),
                  Gap(16),
                ],
              ),
            ),
            Gap(4),
            AppBorderContainer(
              horizontalPadding: 0,
              borderRadius: 0,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenPaddding),
                    child: FilterWidget(text: "Total PNL"),
                  ),
                  //  AppChartItem(),
                ],
              ),
            ),
            Gap(4),
            AllocationItem(),
            Gap(4),
            HoldingPeriodItem(),
            Gap(bottomPaddding),
          ],
        ),
      ),
    );
  }
}
