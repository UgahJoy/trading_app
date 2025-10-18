import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/constants.dart';
import 'package:trading_app/helper_files/helper_function.dart';
import 'package:trading_app/models/pro_traders_model.dart';
import 'package:trading_app/shared_widgets/name_abbrevation_widget.dart';
import 'package:trading_app/theme/app_textstyle.dart';
import 'package:trading_app/theme/colors.dart';

class TradersNameWidget extends StatelessWidget {
  final ProTradersModel model;
  final Color color;
  final Color bgColor;
  final bool showCopy;
  const TradersNameWidget({
    super.key,
    required this.color,
    this.showCopy = true,
    required this.model,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenPaddding, vertical: 16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Hero(
                  tag: model.leadPortfolioId ?? "",
                  child: Material(
                    color: AppColors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        NameAbbrevationWidget(
                          showCopy: showCopy,
                          name: cleanInitials(
                            model.nickname ?? "",
                          ).toUpperCase(),
                          borderColor: color,
                          bgColor: bgColor.withValues(alpha: 0.14),
                        ),

                        Gap(12),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    (model.nickname ?? ""),
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
                                  if (!showCopy) ...[Gap(4)],
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/user.png",
                                        height: 16,
                                      ),
                                      Gap(6),
                                      Text(
                                        showCopy
                                            ? "${model.currentCopyCount ?? 0}"
                                            : "${model.currentCopyCount ?? 0} Copiers",
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
                          ),
                        ),
                      ],
                    ),
                  ),
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
          if (showCopy) ...[
            Container(
              height: 0.5,
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withValues(alpha: 0.05),
              ),
              margin: EdgeInsets.only(top: 16),
            ),
          ],
        ],
      ),
    );
  }
}
