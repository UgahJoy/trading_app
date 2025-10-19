import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/app_router.dart';
import 'package:trading_app/helper_files/constants.dart';
import 'package:trading_app/helper_files/extensions.dart';
import 'package:trading_app/presentation/transactions/confrim_transaction.dart';
import 'package:trading_app/presentation/transactions/widget/traction_app_bar.dart';
import 'package:trading_app/shared_widgets/app_alert.dart';
import 'package:trading_app/shared_widgets/app_button.dart';
import 'package:trading_app/shared_widgets/app_scaffold.dart';
import 'package:trading_app/shared_widgets/currency_formater.dart';
import 'package:trading_app/theme/app_textstyle.dart';
import 'package:trading_app/theme/colors.dart';
import 'package:flutter/services.dart';

class EnterAmount extends StatefulWidget {
  const EnterAmount({super.key});

  @override
  State<EnterAmount> createState() => _EnterAmountState();
}

class _EnterAmountState extends State<EnterAmount> {
  final FocusNode _focusNode = FocusNode();
  TextEditingController amountController = TextEditingController();
  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    amountController = TextEditingController(text: "100 USD");
    super.initState();
  }

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
              onTap: () {
                if (amountController.text.isEmpty ||
                    amountController.text == "USD") {
                  AppAlerts.showError("Please enter a valid amount");
                  return;
                }
                AppRouter.navigateTo(
                  ConfrimTransaction(
                    amount: amountController.text.replaceAll("USD", ""),
                  ),
                );
              },
            ),
            Gap(bottomPaddding),
          ],
        ),
      ),
      body: Column(
        children: [
          Gap(topPadding),
          TranxAppBar(),
          Gap(context.deviceHeight * 0.09),

          SizedBox(
            width: context.deviceWidth * 0.5,
            child: TextFormField(
              controller: amountController,

              focusNode: _focusNode,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CurrencyInputFormatter(),
              ],
              style: header.copyWith(
                fontSize: 36,
                fontWeight: FontWeight.w900,
                fontFamily: "Nexa",
                color: AppColors.primaryColor,
              ),

              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
            ),
          ),
          Gap(24),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.navGrey,
              border: Border.all(color: AppColors.navBorder),
            ),
            child: Text(
              "Transaction fee (1%) - 1.00USD",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryColor,
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
                        style: TextStyle(
                          color: AppColors.iconGrey,
                          fontSize: 10,
                        ),
                      ),

                      Text(
                        "\$240.73",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor,
                        ),
                        //updateGrey
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
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
