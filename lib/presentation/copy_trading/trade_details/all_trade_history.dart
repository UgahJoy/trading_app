import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/extensions.dart';
import 'package:trading_app/models/pro_traders_model.dart';
import 'package:trading_app/models/trade_history_mode.dart';
import 'package:trading_app/presentation/copy_trading/copy_trading_dashboard_picker/widgets/copy_trade_history_widget.dart';
import 'package:trading_app/presentation/copy_trading/trade_details/widgets/trade_history_selector.dart';
import 'package:trading_app/repositories/global_repository.dart';
import 'package:trading_app/shared_state/app_state.dart';
import 'package:trading_app/shared_widgets/app_border_conatiner_2.dart';
import 'package:trading_app/shared_widgets/check_mark_indicator.dart';
import 'package:trading_app/shared_widgets/filter_item.dart';

class AllTradeHistory extends ConsumerStatefulWidget {
  final ProTradersModel model;
  const AllTradeHistory({super.key, required this.model});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AllTradeHistoryState();
}

class _AllTradeHistoryState extends ConsumerState<AllTradeHistory> {
  int currentIndex = 0;
  void _onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  bool isBusy = true;

  @override
  void initState() {
    isBusy =
        (ref.read(appState).allTradeHistory[widget.model.leadPortfolioId] ?? [])
            .isEmpty;

    if (isBusy) {
      ref
          .read(globalRepository)
          .fetchTradeHistory(widget.model.leadPortfolioId ?? "")
          .then((val) {
            isBusy = false;
            if (mounted) {
              setState(() {});
            }
          });
      super.initState();
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<TradeHistoryModel> historyList =
        ref.watch(appState).allTradeHistory[widget.model.leadPortfolioId] ?? [];

    return CheckMarkIndicator(
      onRefresh: () async {
        await ref
            .read(globalRepository)
            .fetchTradeHistory(widget.model.leadPortfolioId ?? "");
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppBorderContainer2(
              verticalPadding: 0,
              bottomBorderRadius: 0,
              horizontalPadding: 0,
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
                      Opacity(
                        opacity: currentIndex == 0 ? 0 : 1,
                        child: FilterItem(),
                      ),
                    ],
                  ),

                  IndexedStack(
                    index: currentIndex,
                    children: [
                      TransactionHistoryView(
                        isCurrentTrade: true,
                        isBusy: isBusy,
                        historyList: historyList,
                      ),
                      TransactionHistoryView(
                        isBusy: isBusy,
                        isCurrentTrade: false,
                        historyList: historyList,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Gap(context.deviceHeight * 0.04),
          ],
        ),
      ),
    );
  }
}

class TransactionHistoryView extends StatelessWidget {
  final bool isBusy;
  final bool isCurrentTrade;
  final List<TradeHistoryModel> historyList;
  const TransactionHistoryView({
    super.key,
    required this.isBusy,
    required this.isCurrentTrade,
    required this.historyList,
  });

  @override
  Widget build(BuildContext context) {
    return isBusy
        ? Center(child: CircularProgressIndicator())
        : historyList.isEmpty
        ? SizedBox(
            height: context.deviceHeight * 0.4,
            child: Center(child: Text("No Trade History Found")),
          )
        : CheckMarkIndicator(
            onRefresh: () async {},
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: historyList.length,
              itemBuilder: (context, index) => CopyTradeHistoryWidget(
                isCurrentTrade: isCurrentTrade,
                model: historyList[index],
              ),
            ),
          );
  }
}
