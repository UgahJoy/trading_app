import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trading_app/models/pro_traders_model.dart';
import 'package:trading_app/models/trade_history_mode.dart';

final appState = ChangeNotifierProvider((ref) => AppState(ref));

class AppState with ChangeNotifier {
  final Ref ref;
  List<ProTradersModel> allProTraders = [];

  Map<String, List<TradeHistoryModel>> allTradeHistory = {};
  AppState(this.ref);
  void updateAllProTraders(List<ProTradersModel> allTraders) {
    allProTraders = allTraders;
    notifyListeners();
  }

  void updateTradeHistory(String portfolioId, List<TradeHistoryModel> history) {
    allTradeHistory[portfolioId] = history;
    notifyListeners();
  }
}
