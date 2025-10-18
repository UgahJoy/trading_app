// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:new_pinput/new_pinput.dart';
import 'package:trading_app/theme/app_textstyle.dart';
import 'package:trading_app/theme/colors.dart';

class AppPinFiled extends StatefulWidget {
  final Function(String) onChanged;
  final Function(String) onCompleted;
  final int? plinLength;
  final TextEditingController controller;
  const AppPinFiled({
    super.key,
    this.plinLength,
    required this.onChanged,
    required this.onCompleted,
    required this.controller,
  });

  @override
  State<AppPinFiled> createState() => _AppPinFiled2State();
}

class _AppPinFiled2State extends State<AppPinFiled> {
  @override
  Widget build(BuildContext context) {
    var enableTheme = PinTheme(
      width: 13,
      height: 13,
      textStyle: header.copyWith(fontSize: 24, color: AppColors.indicatorBlue),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.transparent),
        borderRadius: BorderRadius.circular(16),
        color: AppColors.primaryColor,
      ),
    );
    return Pinput(
      controller: widget.controller,
      readOnly: true,
      length: widget.plinLength ?? 4,
      defaultPinTheme: enableTheme,
      focusedPinTheme: enableTheme.copyWith(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      ),
      validator: (s) {
        return null;
      },
      cursor: Container(
        color: AppColors.primaryColor,
        width: 2.0,
        height: 30.0,
      ),
      showCursor: true,
      obscureText: true,
      obscuringWidget: Image.asset(
        "assets/hash.png",
        height: 13,
        color: AppColors.scaffoldBgColor,
      ),
      onChanged: widget.onChanged,
      onCompleted: widget.onCompleted,
    );
  }
}
