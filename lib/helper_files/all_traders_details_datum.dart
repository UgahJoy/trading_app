import 'package:flutter/material.dart';

class AllTradersDetailsDaTum {
  final String name;
  final Color color;
  final Color bgColor;
  AllTradersDetailsDaTum({
    required this.bgColor,
    required this.color,
    required this.name,
  });
}

List<StatisticDataTum> statictis = [
  StatisticDataTum(title: "PRO traders", value: "17", isPro: true),
  StatisticDataTum(title: "Trading days", value: "43"),
  StatisticDataTum(title: "Profit-share", value: "15%"),
  StatisticDataTum(title: "Total orders", value: "56"),
  StatisticDataTum(title: "Average losses", value: "0 USDT", isLoss: true),
  StatisticDataTum(title: "Total copy trades", value: "72"),
  StatisticDataTum(title: "Trading days", value: "17"),
  StatisticDataTum(title: "Total orders", value: "37"),
];

class StatisticDataTum {
  final String title;
  final String value;
  final bool? isLoss;
  final bool? isPro;
  StatisticDataTum({
    this.isLoss,
    this.isPro,
    required this.title,
    required this.value,
  });
}
