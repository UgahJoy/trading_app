class TradeHistoryModel {
  final int? time;
  final String? symbol;
  final String? side;
  final String? executed;
  final String? baseAsset;
  final String? quoteAsset;
  final String? role;
  final String? totalAmount;
  final String? fee;
  final String? feeAsset;

  TradeHistoryModel({
    this.time,
    this.symbol,
    this.side,
    this.executed,
    this.baseAsset,
    this.quoteAsset,
    this.role,
    this.totalAmount,
    this.fee,
    this.feeAsset,
  });

  factory TradeHistoryModel.fromJson(Map<String, dynamic> json) =>
      TradeHistoryModel(
        time: json["time"],
        symbol: json["symbol"],
        side: json["side"],
        executed: json["executed"],
        baseAsset: json["baseAsset"],
        quoteAsset: json["quoteAsset"],
        role: json["role"],
        totalAmount: json["totalAmount"],
        fee: json["fee"],
        feeAsset: json["feeAsset"],
      );

  Map<String, dynamic> toJson() => {
    "time": time,
    "symbol": symbol,
    "side": side,
    "executed": executed,
    "baseAsset": baseAsset,
    "quoteAsset": quoteAsset,
    "role": role,
    "totalAmount": totalAmount,
    "fee": fee,
    "feeAsset": feeAsset,
  };
}
