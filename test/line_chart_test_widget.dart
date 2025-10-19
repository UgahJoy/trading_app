import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trading_app/shared_widgets/app_chart_widget.dart';

void main() {
  testWidgets('AppChartItem renders LineChart with given data', (
    WidgetTester tester,
  ) async {
    final testSpots = [
      FlSpot(1633036800000, 1.0),
      FlSpot(1633123200000, 2.5),
      FlSpot(1633209600000, 3.2),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: AppChartItem(valueSpots: testSpots, isPNL: true)),
      ),
    );

    await tester.pumpAndSettle(const Duration(seconds: 2));

    expect(find.byType(LineChart), findsOneWidget);
  });
}
