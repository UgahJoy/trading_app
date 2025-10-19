// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/constants.dart';
import 'package:trading_app/helper_files/extensions.dart';
import 'package:trading_app/shared_widgets/filter_widget.dart';
import 'package:trading_app/theme/app_textstyle.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:trading_app/theme/colors.dart';

class AllocationItem extends StatelessWidget {
  const AllocationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: screenPaddding),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.navBorder),
        color: AppColors.navGrey,
      ),
      child: Column(
        children: [
          Gap(20),
          FilterWidget(text: "Assets allocation"),
          Gap(20),
          SizedBox(height: 184, child: AppPieChart()),
          Gap(30),
        ],
      ),
    );
  }
}

class AppPieChart extends StatefulWidget {
  const AppPieChart({super.key});

  @override
  State<AppPieChart> createState() => _AppPieChartState();
}

class _AppPieChartState extends State<AppPieChart> {
  Map<String, double> dataMap = {"Pro_trader": 5};
  final colorList = [Color(0xffFBC98D)];
  double _centerOpacity = 0.0;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 1000), () {
      if (mounted) {
        setState(() {
          _centerOpacity = 1.0;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PieChart(
      dataMap: dataMap,
      animationDuration: Duration(milliseconds: 2000),

      chartRadius: context.deviceHeight / 2.2,
      colorList: colorList,
      initialAngleInDegree: 0,
      chartType: ChartType.ring,
      ringStrokeWidth: 32,

      centerWidget: AnimatedOpacity(
        opacity: _centerOpacity,
        duration: Duration(milliseconds: 500),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.pieChartInnerYellow,
            shape: BoxShape.circle,
          ),
          width: 200,
          height: 200,

          child: Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: AppColors.scaffoldBgColor,
              shape: BoxShape.circle,
            ),
            width: 150,
            height: 150,
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "BTCUSDT",
                  style: const TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 8),
                Text("100.00%", style: header2),
              ],
            ),
          ),
        ),
      ),

      legendOptions: LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.right,
        showLegends: false,
        legendShape: BoxShape.circle,
        legendTextStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: false,
        showChartValues: false,
        showChartValuesInPercentage: false,
        showChartValuesOutside: false,
        decimalPlaces: 1,
      ),
    );
  }
}
