import 'package:flutter/material.dart';
import 'package:trading_app/helper_files/constants.dart';
import 'package:trading_app/theme/colors.dart';

class AppTextfield extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final Function()? onTap;
  final Function(String)? onChanged;
  const AppTextfield({
    super.key,
    this.onTap,
    required this.hintText,
    this.onChanged,
    required this.controller,
  });

  @override
  State<AppTextfield> createState() => _AppTextfieldState();
}

class _AppTextfieldState extends State<AppTextfield> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenPaddding),
      child: SizedBox(
        height: 40,
        child: TextFormField(
          onTap: widget.onTap,
          onChanged: widget.onChanged,

          cursorColor: AppColors.primaryColor,

          controller: widget.controller,
          decoration: InputDecoration(
            hintText: widget.hintText,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            hintStyle: TextStyle(fontSize: 14),

            suffixIcon: Padding(
              padding: const EdgeInsets.all(10.0),

              child: Image.asset(
                color: AppColors.iconGrey,
                "assets/search.png",
                height: 20,
              ),
            ),
            filled: true,

            fillColor: AppColors.updateGrey,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.navBorder),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.transparent),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.transparent),
            ),
          ),
        ),
      ),
    );
  }
}
