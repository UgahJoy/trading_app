import 'dart:io';

import 'package:flutter/material.dart';
import 'package:trading_app/theme/colors.dart';

double screenPaddding = 16;
double bottomPaddding = Platform.isIOS ? 24 : 40;
double topPadding = Platform.isAndroid ? 30 : 20;

List<Color> allColors = [
  AppColors.proTradersBlue,
  AppColors.proTradersYellow,
  AppColors.proTradersGreen,
  AppColors.indicatorBlue,
  AppColors.blue1,
];
