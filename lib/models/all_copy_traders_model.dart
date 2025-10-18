class AllCopyTradersModel {
  final String? nickname;
  final String? avatarUrl;
  final double? balanceAmount;
  final String? balanceAsset;
  final double? totalPnl;
  final String? totalPnlAsset;
  final double? totalRoi;
  final int? startTime;

  AllCopyTradersModel({
    this.nickname,
    this.avatarUrl,
    this.balanceAmount,
    this.balanceAsset,
    this.totalPnl,
    this.totalPnlAsset,
    this.totalRoi,
    this.startTime,
  });

  factory AllCopyTradersModel.fromJson(Map<String, dynamic> json) =>
      AllCopyTradersModel(
        nickname: json["nickname"],
        avatarUrl: json["avatarUrl"],
        balanceAmount: json["balanceAmount"]?.toDouble(),
        balanceAsset: json["balanceAsset"],
        totalPnl: json["totalPnl"]?.toDouble(),
        totalPnlAsset: json["totalPnlAsset"],
        totalRoi: json["totalRoi"]?.toDouble(),
        startTime: json["startTime"],
      );

  Map<String, dynamic> toJson() => {
    "nickname": nickname,
    "avatarUrl": avatarUrl,
    "balanceAmount": balanceAmount,
    "balanceAsset": balanceAsset,
    "totalPnl": totalPnl,
    "totalPnlAsset": totalPnlAsset,
    "totalRoi": totalRoi,
    "startTime": startTime,
  };
}
