class RioModel {
  final double? value;
  final String? dataType;
  final dynamic dateTime;

  RioModel({this.value, this.dataType, this.dateTime});

  factory RioModel.fromJson(Map<String, dynamic> json) => RioModel(
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
