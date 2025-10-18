import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trading_app/models/all_copy_traders_model.dart';
import 'package:trading_app/models/pro_traders_model.dart';
import 'package:trading_app/models/trade_history_mode.dart';
import 'package:trading_app/services/api_services.dart';
import 'package:trading_app/shared_state/app_state.dart';

final globalRepository = Provider((ref) => GlobalRepository(ref));

class GlobalRepository {
  final Ref ref;
  GlobalRepository(this.ref);

  Future<void> fetchProTraders() async {
    var response =
        await ApiServices(
          key: "spot-copy-trade/common/home-page-list",
          showProgressLoader: false,
        ).postRequst({
          "pageNumber": 1,
          "pageSize": 100,
          "timeRange": "7D",
          "dataType": "RIO",
          "favoriteOnly": false,
          "hideFull": false,
          "order": "DESC",
          "portfolioType": "ALL",
        });
    if (response == "failed") {
      return;
    }
    ref
        .read(appState)
        .updateAllProTraders(
          (response['data']['list'] as List)
              .map((e) => ProTradersModel.fromJson(e))
              .toList(),
        );
  }

  Future<void> fetchTradeHistory(String portfolioId) async {
    var response = await ApiServices(
      key: "spot-copy-trade/lead-portfolio/get-trade-history-by-page",
    ).postRequst({"pageNumber": 1, "pageSize": 50, "portfolioId": portfolioId});
    if (response == "failed") {
      return;
    }

    final List rawHistoryList = response['data']['list'] as List;

    final List<TradeHistoryModel> newHistoryList = rawHistoryList
        .map((e) => TradeHistoryModel.fromJson(e as Map<String, dynamic>))
        .toList();

    ref.read(appState).updateTradeHistory(portfolioId, newHistoryList);
  }

  Future<void> fectAllCopyTraders(String portfolioId) async {
    var response =
        await ApiServices(
          key: "spot-copy-trade/lead-portfolio/get-copy-trader-result-by-page",
        ).postRequst({
          "pageNumber": 1,
          "pageSize": 50,
          "portfolioId": portfolioId, //"3964077903873533185",
        });
    if (response == "failed") {
      return;
    }
    final List rawTradersData = response['data']['list'] as List;
    final List<AllCopyTradersModel> newTradersData = rawTradersData
        .map((e) => AllCopyTradersModel.fromJson(e as Map<String, dynamic>))
        .toList();

    ref.read(appState).updateAllCopyTraders(portfolioId, newTradersData);
  }
}

//AllCopyTradersModel



  //