class ProTradersModel {
  final String? leadPortfolioId;
  final String? nickname;
  final String? avatarUrl;
  final int? currentCopyCount;
  final int? maxCopyCount;
  final int? riskControlMaxCopyCount;
  final int? finalEffectiveMaxCopyCount;
  final double? roi;
  final double? pnl;
  final double? aum;
  final double? mdd;
  final String? apiKeyTag;
  final double? sharpRatio;
  final List<ChartItem>? chartItems;
  final String? badgeName;
  final int? badgeModifyTime;
  final int? badgeCopierCount;
  final String? portfolioType;
  final int? tradingDays;

  ProTradersModel({
    this.leadPortfolioId,
    this.nickname,
    this.avatarUrl,
    this.currentCopyCount,
    this.maxCopyCount,
    this.riskControlMaxCopyCount,
    this.finalEffectiveMaxCopyCount,
    this.roi,
    this.pnl,
    this.aum,
    this.mdd,
    this.apiKeyTag,
    this.sharpRatio,
    this.chartItems,
    this.badgeName,
    this.badgeModifyTime,
    this.badgeCopierCount,
    this.portfolioType,
    this.tradingDays,
  });

  factory ProTradersModel.fromJson(Map<String, dynamic> json) =>
      ProTradersModel(
        leadPortfolioId: json["leadPortfolioId"],
        nickname: json["nickname"],
        avatarUrl: json["avatarUrl"],
        currentCopyCount: json["currentCopyCount"],
        maxCopyCount: json["maxCopyCount"],
        riskControlMaxCopyCount: json["riskControlMaxCopyCount"],
        finalEffectiveMaxCopyCount: json["finalEffectiveMaxCopyCount"],
        roi: json["roi"]?.toDouble(),
        pnl: json["pnl"]?.toDouble(),
        aum: json["aum"]?.toDouble(),
        mdd: json["mdd"]?.toDouble(),
        apiKeyTag: json["apiKeyTag"],
        sharpRatio: json["sharpRatio"]?.toDouble(),
        chartItems: json["chartItems"] == null
            ? []
            : List<ChartItem>.from(
                json["chartItems"]!.map((x) => ChartItem.fromJson(x)),
              ),
        badgeName: json["badgeName"],
        badgeModifyTime: json["badgeModifyTime"],
        badgeCopierCount: json["badgeCopierCount"],
        portfolioType: json["portfolioType"],
        tradingDays: json["tradingDays"],
      );

  Map<String, dynamic> toJson() => {
    "leadPortfolioId": leadPortfolioId,
    "nickname": nickname,
    "avatarUrl": avatarUrl,
    "currentCopyCount": currentCopyCount,
    "maxCopyCount": maxCopyCount,
    "riskControlMaxCopyCount": riskControlMaxCopyCount,
    "finalEffectiveMaxCopyCount": finalEffectiveMaxCopyCount,
    "roi": roi,
    "pnl": pnl,
    "aum": aum,
    "mdd": mdd,
    "apiKeyTag": apiKeyTag,
    "sharpRatio": sharpRatio,
    "chartItems": chartItems == null
        ? []
        : List<dynamic>.from(chartItems!.map((x) => x.toJson())),
    "badgeName": badgeName,
    "badgeModifyTime": badgeModifyTime,
    "badgeCopierCount": badgeCopierCount,
    "portfolioType": portfolioType,
    "tradingDays": tradingDays,
  };
}

class ChartItem {
  final double? value;
  final String? proTradersModelType;
  final int? dateTime;

  ChartItem({this.value, this.proTradersModelType, this.dateTime});

  factory ChartItem.fromJson(Map<String, dynamic> json) => ChartItem(
    value: json["value"]?.toDouble(),
    proTradersModelType: json["ProTradersModelType"],
    dateTime: json["dateTime"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "ProTradersModelType": proTradersModelType,
    "dateTime": dateTime,
  };
}
