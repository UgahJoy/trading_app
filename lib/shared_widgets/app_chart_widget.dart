import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:trading_app/helper_files/extensions.dart';
import 'package:trading_app/helper_files/global_variables.dart';
import 'package:trading_app/helper_files/helper_function.dart';
import 'package:trading_app/theme/colors.dart';

class AppChartItem extends StatefulWidget {
  AppChartItem({
    super.key,
    Color? line1Color,
    Color? line2Color,
    Color? betweenColor,
    required this.valueSpots,
    required this.isPNL,
  }) : line1Color = line1Color ?? AppColors.generalAppLineChartGreen,
       line2Color = line2Color ?? AppColors.generalAppLineChartGreen2,
       betweenColor =
           betweenColor ?? AppColors.chartGreen.withValues(alpha: 0.5);

  final Color line1Color;
  final Color line2Color;
  final Color betweenColor;
  final List<FlSpot> valueSpots;
  final bool isPNL;

  @override
  State<AppChartItem> createState() => _AppChartItemState();
}

class _AppChartItemState extends State<AppChartItem>
    with SingleTickerProviderStateMixin {
  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 11);
    final date = DateTime.fromMillisecondsSinceEpoch(
      int.parse((value ~/ 1).toString()),
    );
    final text = formatGraphTime(date);

    return SideTitleWidget(
      fitInside: SideTitleFitInsideData(
        enabled: true,
        axisPosition: 0,
        parentAxisSize: 0,
        distanceFromEdge: navigatorKey.currentContext!.deviceWidth * 0.015,
      ),
      meta: meta,
      child: Text(text, style: style),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    if (value == meta.max) {
      return const Text('');
    } else if (value == meta.min) {
      return const Text('');
    }

    const style = TextStyle(fontSize: 11);

    return SideTitleWidget(
      meta: meta,
      child: FittedBox(
        child: Text(
          maxLines: 1,
          '${formatNumberAbbreviated(value)}${widget.isPNL ? "" : "%"}',
          style: style,
        ),
      ),
    );
  }

  late AnimationController _animationController;
  late Animation<double> _animation;
  double _maxYValue = 0;
  double _minYValue = 0;

  @override
  void initState() {
    super.initState();

    final List<num> values = widget.valueSpots.map((e) => e.y).toList();
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
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.6,
      child: Padding(
        padding: EdgeInsets.only(left: 6, right: 10, top: 10, bottom: 0),
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return LineChart(getLineChargeData(_animation.value));
          },
        ),
      ),
    );
  }

  LineChartData getLineChargeData(animationValue) {
    final List<FlSpot> animatedSpots = widget.valueSpots.map((e) {
      final double targetValue = (e.y + (getLeftInterval * 0.3)).toDouble();
      final double targetX = (e.x).toDouble();

      final double animatedYValue =
          _minYValue + (targetValue - _minYValue) * animationValue;

      return FlSpot(targetX, animatedYValue);
    }).toList();

    final List<FlSpot> animatedSpots2 = widget.valueSpots.map((e) {
      final double targetValue = (e.y).toDouble();
      final double targetX = (e.x).toDouble();

      final double animatedYValue =
          _minYValue + (targetValue - _minYValue) * animationValue;

      return FlSpot(targetX, animatedYValue);
    }).toList();

    return LineChartData(
      lineTouchData: const LineTouchData(enabled: false),
      lineBarsData: [
        LineChartBarData(
          spots: animatedSpots,
          isCurved: true,
          barWidth: 1,
          color: AppColors.transparent,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                widget.line1Color.withValues(alpha: 0.2),
                widget.line1Color.withValues(alpha: 0.0),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        LineChartBarData(
          spots: animatedSpots2,
          isCurved: true,
          barWidth: 2,
          color: AppColors.chartGreen,
          dotData: const FlDotData(show: false),
        ),
      ],

      minY: _minYValue,
      maxY: _maxYValue,
      minX: getMinValue(widget.valueSpots.map((e) => e.x).toList()),
      maxX: getMaxValue(widget.valueSpots.map((e) => e.x).toList()),
      borderData: FlBorderData(show: false),
      titlesData: FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: getBottomInterval,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: leftTitleWidgets,
            interval: getLeftInterval,
            reservedSize: 40,
          ),
        ),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: getLeftInterval,
        checkToShowHorizontalLine: (double value) {
          return true;
        },
        getDrawingHorizontalLine: (double value) {
          return FlLine(
            color: AppColors.primaryColor.withValues(alpha: 0.05),
            strokeWidth: 0.15,
          );
        },
      ),
    );
  }

  get getLeftInterval =>
      ((getMaxValue(widget.valueSpots.map((e) => e.y).toList()) -
              getMinValue(widget.valueSpots.map((e) => e.y).toList())) /
          7) +
      ((getMaxValue(widget.valueSpots.map((e) => e.y).toList()) -
              getMinValue(widget.valueSpots.map((e) => e.y).toList())) *
          0.05);

  get getBottomInterval =>
      ((getMaxValue(widget.valueSpots.map((e) => e.x).toList()) -
              getMinValue(widget.valueSpots.map((e) => e.x).toList())) /
          6) +
      ((getMaxValue(widget.valueSpots.map((e) => e.x).toList()) -
              getMinValue(widget.valueSpots.map((e) => e.x).toList())) *
          0.05);

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
