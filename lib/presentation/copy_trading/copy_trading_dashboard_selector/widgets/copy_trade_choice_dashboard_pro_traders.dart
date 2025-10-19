import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/app_router.dart';
import 'package:trading_app/helper_files/helper_function.dart';
import 'package:trading_app/models/pro_traders_model.dart';
import 'package:trading_app/presentation/copy_trading/trading_details/trade_details_dashboard.dart';
import 'package:trading_app/presentation/copy_trading/copy_trading_dashboard_selector/widgets/trade_chart_item.dart';
import 'package:trading_app/presentation/copy_trading/copy_trading_dashboard_selector/widgets/traders_name_widget.dart';
import 'package:trading_app/shared_widgets/app_Inkwell.dart';
import 'package:trading_app/theme/app_textstyle.dart';
import 'package:trading_app/theme/colors.dart';

class DashboardChoiceProTradersWidget extends StatelessWidget {
  final ProTradersModel model;
  final Color bgColor;
  const DashboardChoiceProTradersWidget({
    super.key,
    required this.bgColor,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return AppInkWell(
      onTap: () => AppRouter.navigateTo(TradeDetailsDashboard(model: model)),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
              color: AppColors.navGrey,
              border: Border.all(color: AppColors.navBorder),
              borderRadius: BorderRadius.circular(16),
            ),

            child: Column(
              children: [
                TradersNameWidget(
                  model: model,
                  bgColor: bgColor,
                  color: bgColor,
                ),

                TradeChartItem(model: model),
                Divider(),
              ],
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 68,
            child: Container(
              margin: EdgeInsets.only(bottom: 20),

              decoration: BoxDecoration(
                color: AppColors.scaffoldBgColor,
                border: Border(
                  right: BorderSide(color: AppColors.navBorder),
                  left: BorderSide(color: AppColors.navBorder),
                  bottom: BorderSide(color: AppColors.navBorder),
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Column(
                children: [
                  Gap(14),

                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              text: "Win rate: ",
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.iconGrey,
                              ),
                              children: [
                                TextSpan(
                                  text: "100%",
                                  style: header.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        Image.asset("assets/info.png", height: 12),
                        Gap(4),
                        RichText(
                          text: TextSpan(
                            text: "AUM: ",
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.iconGrey,
                            ),
                            children: [
                              TextSpan(
                                text: formatNumbers(
                                  model.aum,
                                  formateForm: "#,##0.00",
                                ),
                                style: header.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
