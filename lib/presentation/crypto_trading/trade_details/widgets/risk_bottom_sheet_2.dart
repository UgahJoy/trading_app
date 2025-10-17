// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/app_router.dart';
import 'package:trading_app/helper_files/constants.dart';
import 'package:trading_app/helper_files/extensions.dart';
import 'package:trading_app/presentation/transactions/enter_amount.dart';
import 'package:trading_app/shared_widgets/app_bottom_sheet_cancel_button.dart';
import 'package:trading_app/shared_widgets/app_button.dart';
import 'package:trading_app/theme/app_textstyle.dart';
import 'package:trading_app/theme/colors.dart';

class RiskBottomSheet2 extends StatefulWidget {
  const RiskBottomSheet2({super.key});

  @override
  State<RiskBottomSheet2> createState() => _RiskBottomSheet2State();
}

class _RiskBottomSheet2State extends State<RiskBottomSheet2> {
  List<DataTum> info = [
    DataTum(
      content:
          "All investments carry risks, including potential loss of capital.",
      title: "Market risks",
    ),
    DataTum(
      content:
          "All investments carry risks, including potential loss of capital.",
      title: "Dependency on others",
    ),
    DataTum(
      content:
          "All investments carry risks, including potential loss of capital.",
      title: "Mismatched risk profiles",
    ),
    DataTum(
      content:
          "All investments carry risks, including potential loss of capital.",
      title: "Control and understanding",
    ),
    DataTum(
      content:
          "All investments carry risks, including potential loss of capital.",
      title: "Emotional decisions",
    ),
    DataTum(
      content:
          "All investments carry risks, including potential loss of capital.",
      title: "Costs involved",
    ),
    DataTum(
      content:
          "All investments carry risks, including potential loss of capital.",
      title: "Diversify",
    ),
    DataTum(
      content:
          "All investments carry risks, including potential loss of capital.",
      title: "Execution risks",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.deviceHeight * 0.94,
      padding: EdgeInsets.symmetric(horizontal: screenPaddding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        border: Border.all(color: AppColors.navBorder),
        color: AppColors.scaffoldBgColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppBottomSheetCancelButton(),
          Gap(20),
          Text(
            "Risks involved in copy trading",
            style: header.copyWith(fontSize: 20),
          ),
          Gap(20),
          Text(
            textAlign: TextAlign.center,
            "Please make sure you read the following risks involved in copy trading before making a decision.",
            style: TextStyle(fontSize: 15, color: AppColors.iconGrey),
          ),
          Gap(20),

          Expanded(
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.navGrey,
                  border: Border.all(color: AppColors.navBorder),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: ListView.builder(
                  padding: EdgeInsetsDirectional.only(top: 0),
                  itemCount: info.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Column(
                    children: [
                      Theme(
                        data: Theme.of(
                          context,
                        ).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: Text(info[index].title, style: header2),
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: screenPaddding,
                                vertical: 8.0,
                              ),
                              child: Text(
                                info[index].content,
                                style: TextStyle(
                                  color: AppColors.iconGrey,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      if (index < info.length - 1) ...[Divider()],
                    ],
                  ),
                ),
              ),
            ),
          ),

          Gap(30),
          AppButton(
            onTap: () {
              Navigator.pop(context);

              AppRouter.navigateTo(EnterAmount());
            },
            text: "I have read the risks",
          ),

          Gap(bottomPaddding),
        ],
      ),
    );
  }
}

class DataTum {
  final String title;
  final String content;
  DataTum({required this.content, required this.title});
}
