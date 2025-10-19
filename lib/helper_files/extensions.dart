import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  double get deviceHeight => MediaQuery.of(this).size.height;
  double get deviceWidth => MediaQuery.of(this).size.width;
}

extension StringExtensions on String {
  double toDouble() {
    return double.tryParse(toString().replaceAll(",", "")) ?? 0.0;
  }

  String capitalizeFirstLetter() {
    if (isEmpty) {
      return "";
    }
    return this[0].toUpperCase() + substring(1);
  }
}
