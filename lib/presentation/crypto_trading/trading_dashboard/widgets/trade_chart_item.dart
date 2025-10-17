import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/constants.dart';
import 'package:trading_app/theme/app_textstyle.dart';
import 'package:trading_app/theme/colors.dart';
import 'package:fl_chart/fl_chart.dart';

class TradeChartItem extends StatelessWidget {
  const TradeChartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenPaddding),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ROI",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15),
                ),
                Gap(4),
                Text(
                  "+120.42%",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: header2.copyWith(
                    fontSize: 16,
                    color: AppColors.chartGreen,
                  ),
                ),
                Gap(6),
                RichText(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    text: "Total PNL: ",
                    style: TextStyle(fontSize: 12, color: AppColors.iconGrey),
                    children: [
                      TextSpan(
                        text: "\$38,667.29",
                        style: header.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(24),
                //
              ],
            ),
          ),
          Gap(20),
          SizedBox(height: 51, width: 132, child: ChartItem()),
        ],
      ),
    );
  }
}

class ChartItem extends StatelessWidget {
  const ChartItem({super.key});

  final List<FlSpot> _spots = const [
    FlSpot(0, 0.5),
    FlSpot(1, 1.5),
    FlSpot(2, 0.8),
    FlSpot(3, 1.2),
    FlSpot(4, 2.0),
    FlSpot(5, 2.5),
    FlSpot(6, 1.8),
    FlSpot(7, 1.0),
    FlSpot(8, 1.7),
    FlSpot(9, 1.2),
    FlSpot(10, 0.7),
    FlSpot(11, 0.7),
  ];

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: false),
          titlesData: const FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          minX: 0,
          maxX: _spots.length.toDouble() - 1,
          minY: 0,
          maxY: 3,
          lineBarsData: [
            LineChartBarData(
              spots: _spots,
              isCurved: true,
              color: AppColors.lineChartGreen1,
              barWidth: 1,
              isStrokeCapRound: true,
              dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    AppColors.lineChartGreen1,
                    AppColors.lineChartGreen1.withValues(alpha: 0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
