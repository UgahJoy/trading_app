import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/constants.dart';
import 'package:trading_app/models/pro_traders_model.dart';
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
  final ProTradersModel model;
  const TradingDetailsChart({super.key, required this.model});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TradingDetailsChartState();
}

class _TradingDetailsChartState extends ConsumerState<TradingDetailsChart> {
  bool isBusy = true;
  bool isBusy2 = true;
  @override
  void initState() {
    isBusy = (ref.read(appState).rioGraph[widget.model.leadPortfolioId] ?? [])
        .isEmpty;
    if (isBusy) {
      ref
          .read(globalRepository)
          .fetchRioGraphDetails(widget.model.leadPortfolioId ?? "")
          .then((val) {
            isBusy = false;
            if (mounted) {
              setState(() {});
            }
          });
    }

    isBusy2 = (ref.read(appState).pNLGraph[widget.model.leadPortfolioId] ?? [])
        .isEmpty;
    if (isBusy2) {
      ref
          .read(globalRepository)
          .fetchPNLGraphDetails(widget.model.leadPortfolioId ?? "")
          .then((val) {
            isBusy2 = false;
            if (mounted) {
              setState(() {});
            }
          });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var rioSpots =
        ref.watch(appState).rioGraph[widget.model.leadPortfolioId] ?? [];
    var pNLSpots =
        ref.watch(appState).pNLGraph[widget.model.leadPortfolioId] ?? [];
    return CheckMarkIndicator(
      onRefresh: () async {
        await ref
            .watch(globalRepository)
            .fetchRioGraphDetails(widget.model.leadPortfolioId ?? "");
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
                          isPNL: false,
                          valueSpots: rioSpots
                              .map(
                                (e) => FlSpot(
                                  (e.dateTime ?? 0).toDouble(),
                                  (e.value ?? 0).toDouble(),
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
                  isBusy2
                      ? AppLoader()
                      : pNLSpots.isEmpty
                      ? EmptyStateWidget()
                      : AppChartItem(
                          isPNL: true,
                          valueSpots: pNLSpots
                              .map(
                                (e) => FlSpot(
                                  (e.dateTime ?? 0).toDouble(),
                                  (e.value ?? 0).toDouble(),
                                ),
                              )
                              .toList(),
                        ),
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
