import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/constants.dart';
import 'package:trading_app/helper_files/helper_function.dart';
import 'package:trading_app/models/pro_traders_model.dart';
import 'package:trading_app/theme/app_textstyle.dart';
import 'package:trading_app/theme/colors.dart';
import 'package:fl_chart/fl_chart.dart';

class TradeChartItem extends StatelessWidget {
  final ProTradersModel model;
  const TradeChartItem({super.key, required this.model});

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
                  "${getPnLValue(model.roi?.toDouble() ?? 0)}%",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: header2.copyWith(
                    fontSize: 16,
                    color: getPnLColor(model.roi?.toDouble() ?? 0),
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
                        text:
                            "\$${formatNumbers(model.pnl, formateForm: '#,##0.00')}",
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
          SizedBox(
            height: 51,
            width: 132,
            child: ChartItemWidget(
              chartItems: model.chartItems ?? [],
              roi: model.roi ?? 0,
            ),
          ),
        ],
      ),
    );
  }
}

//
class ChartItemWidget extends StatefulWidget {
  final List<ChartItem> chartItems;
  final double roi;
  const ChartItemWidget({
    super.key,
    required this.chartItems,
    required this.roi,
  });

  @override
  State<ChartItemWidget> createState() => _ChartItemWidgetState();
}

class _ChartItemWidgetState extends State<ChartItemWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    final List<num> values = widget.chartItems
        .map((e) => e.value ?? 0)
        .toList();
    _minYValue = getMinValue(values);
    _maxYValue = getMaxValue(values);

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  double _maxYValue = 0;
  double _minYValue = 0;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return LineChart(
            getAnimatedChartData(_animation.value),
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeInOut,
          );
        },
      ),
    );
  }

  LineChartData getAnimatedChartData(double animationValue) {
    final List<FlSpot> animatedSpots = widget.chartItems.map((e) {
      final double targetValue = (e.value ?? 0).toDouble();
      final double targetX = (e.dateTime ?? 0).toDouble();

      final double animatedYValue =
          _minYValue + (targetValue - _minYValue) * animationValue;

      return FlSpot(targetX, animatedYValue);
    }).toList();

    return LineChartData(
      gridData: const FlGridData(show: false),
      titlesData: const FlTitlesData(show: false),
      borderData: FlBorderData(show: false),

      minX: getMinValue(widget.chartItems.map((e) => e.dateTime ?? 0).toList()),
      maxX: getMaxValue(widget.chartItems.map((e) => e.dateTime ?? 0).toList()),
      minY: _minYValue,
      maxY: _maxYValue,

      lineBarsData: [
        LineChartBarData(
          spots: animatedSpots,
          color: getPnLColor(
            widget.roi,
            isChart: true,
            successColor: AppColors.proChatGreen,
          ),
          barWidth: 1,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              stops: [0.01, 1],
              colors: [
                getPnLColor(
                  widget.roi,
                  isChart: true,
                  successColor: AppColors.proChatGreen,
                ).withValues(alpha: 0.5 * animationValue), // Fade in opacity
                getPnLColor(
                  widget.roi,
                  isChart: true,
                  successColor: AppColors.proChatGreen,
                ).withValues(alpha: 0.0),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    );
  }
}
