import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/app_router.dart' show AppRouter;
import 'package:trading_app/helper_files/constants.dart';
import 'package:trading_app/helper_files/extensions.dart';
import 'package:trading_app/presentation/transactions/confrim_transaction.dart';
import 'package:trading_app/presentation/transactions/widget/traction_app_bar.dart';
import 'package:trading_app/shared_widgets/app_button.dart';
import 'package:trading_app/shared_widgets/app_scaffold.dart';
import 'package:trading_app/theme/app_textstyle.dart';
import 'package:trading_app/theme/colors.dart';

class EnterAmount extends StatefulWidget {
  const EnterAmount({super.key});

  @override
  State<EnterAmount> createState() => _EnterAmountState();
}

class _EnterAmountState extends State<EnterAmount> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenPaddding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppButton(
              text: "Continue",
              onTap: () => AppRouter.navigateTo(ConfrimTransaction()),
            ),
            Gap(bottomPaddding),
          ],
        ),
      ),
      body: Column(
        children: [
          TractionAppBar(),
          Gap(context.deviceHeight * 0.09),
          Text(
            "100 USD",
            style: header.copyWith(
              fontSize: 40,
              fontWeight: FontWeight.w900,
              fontFamily: "Nexa",
            ),
          ),
          Gap(20),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.navGrey,
              border: Border.all(color: AppColors.navBorder),
            ),
            child: Center(
              child: Text(
                "Transaction fee (1%) - 1.00USD",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),

          Gap(context.deviceHeight * 0.1),
          Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.navGrey,
              border: Border.all(color: AppColors.navBorder),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "USD Balance",
                        style: TextStyle(color: AppColors.iconGrey),
                      ),

                      Text(
                        "\$240.73",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor,
                        ),
                        //updateGrey
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.updateGrey,
                  ),
                  child: Center(
                    child: Text(
                      "Use Max",
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
