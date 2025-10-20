import 'package:fl_chart/fl_chart.dart';

List<StaticticsDataTumItem> myDashboardStatictis = [
  StaticticsDataTumItem(name: "PRO traders", value: "17", isProTrader: true),
  StaticticsDataTumItem(name: "Trading days", value: "43"),
  StaticticsDataTumItem(name: "Profit-share", value: "15%"),
  StaticticsDataTumItem(name: "Total orders", value: "56"),
  StaticticsDataTumItem(name: "Average losses", value: "0 USDT", isLoss: true),
  StaticticsDataTumItem(name: "Total copy trades", value: "72"),
  StaticticsDataTumItem(name: "Trading days", value: "17"),
  StaticticsDataTumItem(name: "Total orders", value: "37", isLast: false),
];

List<StaticticsDataTumItem> tradingDetailsStatictis = [
  StaticticsDataTumItem(name: "Average ROI", value: "+33.73%", isRIO: true),
  StaticticsDataTumItem(name: "Win rates", value: "100%"),
  StaticticsDataTumItem(name: "Total Profit", value: "61850.63 USDT"),
  StaticticsDataTumItem(name: "Average losses", value: "0 USDT", isLoss: true),
  StaticticsDataTumItem(name: "Total trades", value: "72", isLast: false),
];

class CopyTradeRiskLevelDataTum {
  final String title;
  final String body;
  CopyTradeRiskLevelDataTum({required this.body, required this.title});
}

class StaticticsDataTumItem {
  final String name;
  final String value;
  final bool? isProTrader;
  final bool? isLoss;
  final bool? isRIO;
  final bool? isLast;
  StaticticsDataTumItem({
    this.isLoss = false,
    this.isProTrader = false,
    this.isRIO = false,
    this.isLast = true,
    required this.name,
    required this.value,
  });
}

List<String> tradingPairItem = [
  "BTCUSDT",
  "ETHUSDT",
  "XRPUSDT",
  "TIAUSDT",
  "DOGEUSDT",
  "PERPUSDT",
  "TIAUSDT",
  "DOGEUSDT",
  "PERPUSDT",
  "TIAUSDT",
  "DOGEUSDT",
  "PERPUSDT",
];

final List<FlSpot> spotsData = [
  FlSpot(1760313627310, 1000),
  FlSpot(1760400027378, 2000),
  FlSpot(1760486427463, 1200),
  FlSpot(1760572827627, 8000),
  FlSpot(1760659227739, 1200),
  FlSpot(1760745626985, 2522),
  FlSpot(1760832027161, 3234),
  FlSpot(1760918427161, 1553),
  FlSpot(1761004827161, 2833),
  FlSpot(1761091227161, 5532),
];
