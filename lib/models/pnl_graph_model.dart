class PnlModel {
  final double? value;
  final String? dataType;
  final dynamic dateTime;

  PnlModel({this.value, this.dataType, this.dateTime});

  factory PnlModel.fromJson(Map<String, dynamic> json) => PnlModel(
    value: json["value"]?.toDouble(),
    dataType: json["dataType"],
    dateTime: json["dateTime"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "dataType": dataType,
    "dateTime": dateTime,
  };
}
