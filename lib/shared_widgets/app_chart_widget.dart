import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:trading_app/helper_files/helper_function.dart';
import 'package:trading_app/theme/colors.dart';

class AppChartItem extends StatelessWidget {
  AppChartItem({
    super.key,
    Color? line1Color,
    Color? line2Color,
    Color? betweenColor,
    required this.valueSpots,
  }) : line1Color = line1Color ?? AppColors.generalAppLineChartGreen,
       line2Color = line2Color ?? AppColors.generalAppLineChartGreen2,
       betweenColor =
           betweenColor ?? AppColors.chartGreen.withValues(alpha: 0.5);

  final Color line1Color;
  final Color line2Color;
  final Color betweenColor;
  final List<FlSpot> valueSpots;

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    if (value.toInt() % 2 != 0) {
      return SideTitleWidget(meta: meta, space: 4, child: const Text(''));
    }

    const style = TextStyle(fontSize: 10, fontWeight: FontWeight.bold);
    final int monthIndex = value.toInt() + 1; // 1 = Jan, 12 = Dec
    final date = DateTime(2025, monthIndex, 15);
    final text = formatGraphTime(date);

    return SideTitleWidget(
      meta: meta,
      space: 4,
      child: Text(text, style: style),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 10);

    return SideTitleWidget(
      meta: meta,
      child: Text('\$ ${value + 0.5}', style: style),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<FlSpot> spotsDataGlow = valueSpots
        .map((spot) => FlSpot(spot.x, spot.y + 0.5))
        .toList();

    return AspectRatio(
      aspectRatio: 2,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 18, top: 10, bottom: 4),
        child: LineChart(
          LineChartData(
            lineTouchData: const LineTouchData(enabled: false),
            lineBarsData: [
              LineChartBarData(
                spots: spotsDataGlow,
                isCurved: true,
                barWidth: 1,
                color: AppColors.transparent,
                dotData: const FlDotData(show: false),
                belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    colors: [
                      line1Color.withValues(alpha: 0.5),
                      line1Color.withValues(alpha: 0.0),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),

              LineChartBarData(
                spots: valueSpots,
                isCurved: true,
                barWidth: 2,
                color: line1Color,
                dotData: const FlDotData(show: false),
              ),
            ],

            minY: 0,
            borderData: FlBorderData(show: false),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 1,
                  getTitlesWidget: bottomTitleWidgets,
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: leftTitleWidgets,
                  interval: 1,
                  reservedSize: 36,
                ),
              ),
              topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              horizontalInterval: 1,
              checkToShowHorizontalLine: (double value) {
                return value == 1 || value == 6 || value == 4 || value == 5;
              },
            ),
          ),
        ),
      ),
    );
  }
}
