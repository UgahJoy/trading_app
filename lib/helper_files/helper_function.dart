import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trading_app/helper_files/constants.dart';
import 'package:trading_app/theme/colors.dart';

String formatGraphTime(DateTime date) {
  // 'MM' formats the month with a leading zero (01-12)
  // 'dd' formats the day with a leading zero (01-31)
  final formatter = DateFormat('MM-dd');
  return formatter.format(date);
}

Color generateRandomColor(int index) {
  final int selectedColor = index % allColors.length;
  return allColors[selectedColor];
}

String cleanInitials(String name) {
  name = name.trimLeft()..trimRight();
  if (name.isEmpty) {
    return '.';
  }
  if (name.contains(' ')) {
    var tokens = name.split(' ');
    tokens.removeWhere((element) => element.isEmpty);
    if (tokens.length == 1) {
      return tokens[0].trim().characters.first;
    } else {
      return "${tokens[0].trim().characters.first}${tokens[1].trim().characters.first}";
    }
  } else {
    return name.trim().characters.first;
  }
}

String formatNumbers(dynamic value, {String? formateForm}) {
  double values = double.tryParse(value.toString()) ?? 0.0;
  var format = NumberFormat(formateForm ?? '#,##0', 'en_US');

  String formattedAmount;
  if (values != 0) {
    formattedAmount = format.format(values);
  } else {
    formattedAmount = '0';
  }

  return formattedAmount;
}

Color getPnLColor(double value, {bool isChart = false, Color? successColor}) {
  if (value <= 0) {
    return Colors.red;
  }
  if (isChart) {
    return successColor ?? AppColors.lineChartGreen1;
  }
  return successColor ?? AppColors.chartGreen;
}

String getPnLValue(double value) {
  if (value <= 0) {
    return "-\$${formatNumbers(value, formateForm: "#,##0.00")}";
  }
  return "+\$${formatNumbers(value, formateForm: "#,##0.00")}";
}

double getMinValue(List<num> items) {
  if (items.isEmpty) {
    return 0.0;
  }
  double min = items[0].toDouble();

  for (int x = 0; x < items.length; x++) {
    if (min > items[x]) {
      min = items[x].toDouble();
    }
  }

  return min;
}

double getMaxValue(List<num> items) {
  if (items.isEmpty) {
    return 0.0;
  }
  double max = items[0].toDouble();

  for (int x = 0; x < items.length; x++) {
    if (max < items[x]) {
      max = items[x].toDouble();
    }
  }

  return max;
}
