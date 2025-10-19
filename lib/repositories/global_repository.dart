import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trading_app/models/all_coin_model.dart';
import 'package:trading_app/models/all_copy_traders_model.dart';
import 'package:trading_app/models/pnl_graph_model.dart';
import 'package:trading_app/models/pro_traders_model.dart';
import 'package:trading_app/models/rio_graph_model.dart';
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
          "timeRange": "30D",
          "dataType": "ROI",
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
    var response = await ApiServices(
      key: "spot-copy-trade/lead-portfolio/get-copy-trader-result-by-page",
    ).postRequst({"pageNumber": 1, "pageSize": 50, "portfolioId": portfolioId});
    if (response == "failed") {
      return;
    }
    final List rawTradersData = response['data']['list'] as List;
    final List<AllCopyTradersModel> newTradersData = rawTradersData
        .map((e) => AllCopyTradersModel.fromJson(e as Map<String, dynamic>))
        .toList();

    ref.read(appState).updateAllCopyTraders(portfolioId, newTradersData);
  }

  Future<void> fetchAllCoins() async {
    String key =
        "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=30&page=1&sparkline=false";
    var response = await ApiServices(key: key).getRequst(isFull: true);
    if (response == "failed") {
      return;
    }

    ref
        .read(appState)
        .updateAllCoins(
          (response as List).map((e) => AllCoinModel.fromJson(e)).toList(),
        );
    return;
  }

  Future<void> fetchRioGraphDetails(String portfolioId) async {
    String key =
        "https://www.binance.com/bapi/futures/v1/public/future/spot-copy-trade/lead-portfolio/performance-chart-data?dataType=ROI&portfolioId=$portfolioId&timeRange=7D";
    var response = await ApiServices(key: key).getRequst(isFull: true);
    if (response == "failed") {
      return;
    }
    ref
        .read(appState)
        .updateRoiGraph(
          portfolioId,
          (response['data'] as List).map((e) => RioModel.fromJson(e)).toList(),
        );
  }

  Future<void> fetchPNLGraphDetails(String portfolioId) async {
    String key =
        "https://www.binance.com/bapi/futures/v1/public/future/spot-copy-trade/lead-portfolio/performance-chart-data?dataType=PNL&portfolioId=$portfolioId&timeRange=90D";
    var response = await ApiServices(key: key).getRequst(isFull: true);
    if (response == "failed") {
      return;
    }
    ref
        .read(appState)
        .updatePNLGraph(
          portfolioId,
          (response['data'] as List).map((e) => PnlModel.fromJson(e)).toList(),
        );
  }
}
