import 'package:intl/intl.dart';

String formatGraphTime(DateTime date) {
  // 'MM' formats the month with a leading zero (01-12)
  // 'dd' formats the day with a leading zero (01-31)
  final formatter = DateFormat('MM-dd');
  return formatter.format(date);
}
