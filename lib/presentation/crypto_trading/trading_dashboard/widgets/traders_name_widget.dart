import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/constants.dart';
import 'package:trading_app/shared_widgets/name_abbrevation_widget.dart';
import 'package:trading_app/theme/app_textstyle.dart';
import 'package:trading_app/theme/colors.dart';

class TradersNameWidget extends StatelessWidget {
  final String name;
  final Color color;
  final Color bgColor;
  final bool showCopy;
  const TradersNameWidget({
    super.key,
    required this.color,
    this.showCopy = true,
    required this.name,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    String secondLetter = name.split(" ")[1];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenPaddding, vertical: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              NameAbbrevationWidget(
                showCopy: showCopy,
                name: (name[0] + secondLetter[0]).toUpperCase(),
                borderColor: color,
                bgColor: bgColor.withValues(alpha: 0.14),
              ),

              Gap(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: showCopy
                          ? TextStyle(
                              fontSize: 14,
                              color: AppColors.primaryColor,
                            )
                          : header.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                    ),
                    Gap(4),
                    Row(
                      children: [
                        Image.asset("assets/user.png", height: 16),
                        Gap(6),
                        Text(
                          showCopy ? "500" : "500 Copiers",
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.indicatorBlue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (showCopy) ...[
                Gap(20),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.indicatorGrey),
                    color: AppColors.scaffoldBgColor,
                    //bodyTextColor
                  ),
                  child: Center(child: Text("Copy")),
                ),
              ],
            ],
          ),
          if (showCopy) ...[Gap(8), Divider()],
        ],
      ),
    );
  }
}
