import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trading_app/models/all_coin_model.dart';
import 'package:trading_app/models/all_copy_traders_model.dart';
import 'package:trading_app/models/pnl_graph_model.dart';
import 'package:trading_app/models/pro_traders_model.dart';
import 'package:trading_app/models/rio_graph_model.dart';
import 'package:trading_app/models/trade_history_mode.dart';

final appState = ChangeNotifierProvider((ref) => AppState(ref));

class AppState with ChangeNotifier {
  final Ref ref;
  List<ProTradersModel> allProTraders = [];
  List<AllCoinModel> allCoins = [];
  Map<String, List<TradeHistoryModel>> allTradeHistory = {};
  List<PnlModel> pNLGraph = [];
  List<RioModel> rioGraph = [];
  AppState(this.ref);

  void updateAllProTraders(List<ProTradersModel> allTraders) {
    allProTraders = allTraders;
    notifyListeners();
  }

  void updateTradeHistory(String portfolioId, List<TradeHistoryModel> history) {
    allTradeHistory[portfolioId] = history;
    notifyListeners();
  }

  Map<String, List<AllCopyTradersModel>> allCopyTraders = {};
  void updateAllCopyTraders(
    String portfolioId,
    List<AllCopyTradersModel> allTraders,
  ) {
    allCopyTraders[portfolioId] = allTraders;
    notifyListeners();
  }

  void updateAllCoins(List<AllCoinModel> allCoins) {
    this.allCoins = allCoins;
    notifyListeners();
  }

  void updateRoiGraph(List<RioModel> rioGraph) {
    this.rioGraph = rioGraph;
    notifyListeners();
  }

  void updatePNLGraph(List<PnlModel> pNLGraph) {
    this.pNLGraph = pNLGraph;
    notifyListeners();
  }
}
