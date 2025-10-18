import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/app_router.dart';
import 'package:trading_app/helper_files/constants.dart';
import 'package:trading_app/helper_files/extensions.dart';
import 'package:trading_app/presentation/transactions/success_page.dart';
import 'package:trading_app/shared_widgets/app_Inkwell.dart';
import 'package:trading_app/shared_widgets/app_bar_item.dart';
import 'package:trading_app/shared_widgets/app_border_container.dart';
import 'package:trading_app/shared_widgets/app_pin_input.dart';
import 'package:trading_app/shared_widgets/app_scaffold.dart';
import 'package:trading_app/shared_widgets/custome_key_pad.dart';
import 'package:trading_app/theme/app_textstyle.dart';
import 'package:trading_app/theme/colors.dart';

class EnterPin extends StatefulWidget {
  const EnterPin({super.key});

  @override
  State<EnterPin> createState() => _EnterPinState();
}

class _EnterPinState extends State<EnterPin> {
  final pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        children: [
          Gap(topPadding),
          AppBarItem(text: ""),

          Image.asset("assets/pin_lock.png", height: 32),

          Gap(bottomPaddding),
          Text("Confirm Transaction", style: header.copyWith(fontSize: 18)),
          Gap(8),
          Text(
            textAlign: TextAlign.center,
            "Input your 6 digit transaction PIN to confirm\nyour transaction and authenticate your request",
            style: TextStyle(fontSize: 13),
          ),
          Gap(context.deviceHeight * 0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppBorderContainer(
                borderRadius: 12,
                horizontalPadding: 10,
                verticalPadding: 10,
                child: AppPinFiled(
                  plinLength: 6,
                  controller: pinController,
                  onChanged: (va) {
                    setState(() {});
                  },
                  onCompleted: (va) {
                    setState(() {});
                    AppRouter.navigateTo(SuccessPage());
                  },
                ),
              ),

              Gap(12),
              AppInkWell(
                onTap: () {},
                child: AppBorderContainer(
                  borderRadius: 8,
                  horizontalPadding: 5,
                  verticalPadding: 5,
                  child: Image.asset("assets/biometrics.png", height: 24),
                ),
              ),
            ],
          ),

          Expanded(
            child: CustomeKeyPad(
              controller: pinController,
              focusNode: FocusNode(),
              onchanged: (va) {
                setState(() {});
              },
              onCompleted: (va) {
                setState(() {});
              },
            ),
          ),
          Gap(20),
          Text("Forget Pin?", style: TextStyle(color: AppColors.indicatorBlue)),
          Gap(bottomPaddding),
        ],
      ),
    );
  }
}
