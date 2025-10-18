import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:trading_app/theme/colors.dart';

class HoldingPeriodGraph extends StatefulWidget {
  const HoldingPeriodGraph({super.key});

  @override
  State<StatefulWidget> createState() => _HoldingPeriodGraphState();
}

class _HoldingPeriodGraphState extends State {
  int touchedIndex = -1;

  final _availableColors = [
    AppColors.chartGreen,
    AppColors.chartGreen,
    AppColors.chartGreen,
    AppColors.chartGreen,
    AppColors.chartGreen,
    AppColors.chartGreen,
    AppColors.chartGreen,
    AppColors.chartGreen,
    AppColors.chartGreen,
    AppColors.red,
    AppColors.red,
  ];

  List<int> selectedSpots = [];

  static FlDotPainter _getPaint(Color color) {
    return FlDotCirclePainter(color: color, radius: 4);
  }

  @override
  Widget build(BuildContext context) {
    final data = [
      (4.0, 4.0, 4.0),
      (2.0, 5.0, 12.0),
      (4.0, 5.0, 8.0),
      (8.0, 6.0, 20.0),
      (5.0, 7.0, 14.0),
      (7.0, 2.0, 18.0),
      (3.0, 2.0, 36.0),
      (2.0, 8.0, 22.0),
      (8.0, 8.0, 32.0),
      (5.0, 2.5, 24.0),
      (3.0, 7.0, 18.0),
    ];
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        children: [
          ScatterChart(
            ScatterChartData(
              scatterSpots: data.asMap().entries.map((e) {
                final index = e.key;
                final (double x, double y, double size) = e.value;
                return ScatterSpot(
                  x,
                  y,
                  dotPainter: _getPaint(_availableColors[index]),
                );
              }).toList(),
              minX: 0,
              maxX: 10,
              minY: 0,
              maxY: 10,
              borderData: FlBorderData(show: false),
              gridData: FlGridData(
                show: true,
                drawHorizontalLine: true,
                checkToShowHorizontalLine: (value) => true,
                getDrawingHorizontalLine: (value) => FlLine(
                  strokeWidth: 0.5,
                  color: AppColors.primaryColor.withValues(alpha: 0.03),
                ),
                drawVerticalLine: false,
                checkToShowVerticalLine: (value) => false,
              ),
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40,

                    getTitlesWidget: (value, meta) {
                      if (value % 2 == 0) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            '${value.toInt()}k',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),

                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 30,
                    getTitlesWidget: (value, meta) {
                      String text;
                      if (value.toInt() == 2) {
                        text = '1m';
                      } else if (value.toInt() == 4) {
                        text = '24h';
                      } else if (value.toInt() == 6) {
                        text = '5d';
                      } else if (value.toInt() == 8) {
                        text = '15d';
                      } else {
                        return const SizedBox.shrink(); // Hide other ticks
                      }
                      return Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          text,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                show: true,
                topTitles: AxisTitles(sideTitles: SideTitles()),
                rightTitles: const AxisTitles(sideTitles: SideTitles()),
              ),
              showingTooltipIndicators: selectedSpots,
              scatterTouchData: ScatterTouchData(
                enabled: true,
                handleBuiltInTouches: false,
                mouseCursorResolver:
                    (FlTouchEvent touchEvent, ScatterTouchResponse? response) {
                      return response == null || response.touchedSpot == null
                          ? MouseCursor.defer
                          : SystemMouseCursors.click;
                    },
                touchTooltipData: ScatterTouchTooltipData(
                  getTooltipColor: (ScatterSpot touchedBarSpot) {
                    return touchedBarSpot.dotPainter.mainColor;
                  },
                  getTooltipItems: (ScatterSpot touchedBarSpot) {
                    final bool isBgDark = switch ((
                      touchedBarSpot.x,
                      touchedBarSpot.y,
                    )) {
                      (4.0, 4.0) => false,
                      (2.0, 5.0) => false,
                      (4.0, 5.0) => true,
                      (8.0, 6.0) => true,
                      (5.0, 7.0) => true,
                      (7.0, 2.0) => true,
                      (3.0, 2.0) => true,
                      (2.0, 8.0) => false,
                      (8.0, 8.0) => true,
                      (5.0, 2.5) => false,
                      (3.0, 7.0) => true,
                      _ => false,
                    };

                    final color1 = isBgDark ? Colors.grey[100] : Colors.black87;
                    final color2 = isBgDark ? Colors.white : Colors.black;
                    return ScatterTooltipItem(
                      'X: ',
                      textStyle: TextStyle(
                        height: 1.2,
                        color: color1,
                        fontStyle: FontStyle.italic,
                      ),
                      bottomMargin: 10,
                      children: [
                        TextSpan(
                          text: '${touchedBarSpot.x.toInt()} \n',
                          style: TextStyle(
                            color: color2,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: 'Y: ',
                          style: TextStyle(
                            height: 1.2,
                            color: color1,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        TextSpan(
                          text: touchedBarSpot.y.toInt().toString(),
                          style: TextStyle(
                            color: color2,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                touchCallback:
                    (FlTouchEvent event, ScatterTouchResponse? touchResponse) {
                      if (touchResponse == null ||
                          touchResponse.touchedSpot == null) {
                        return;
                      }
                      if (event is FlTapUpEvent) {
                        final sectionIndex =
                            touchResponse.touchedSpot!.spotIndex;
                        setState(() {
                          if (selectedSpots.contains(sectionIndex)) {
                            selectedSpots.remove(sectionIndex);
                          } else {
                            selectedSpots.add(sectionIndex);
                          }
                        });
                      }
                    },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
