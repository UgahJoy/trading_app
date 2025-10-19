// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/app_router.dart';
import 'package:trading_app/helper_files/constants.dart';
import 'package:trading_app/helper_files/extensions.dart';
import 'package:trading_app/presentation/copy_trading/copy_trading_dashboard_selector/copy_trading_dashboard_choice_selector.dart';
import 'package:trading_app/shared_widgets/app_InkWell.dart';
import 'package:trading_app/shared_widgets/app_border_container.dart';
import 'package:trading_app/theme/app_textstyle.dart';
import 'package:trading_app/theme/colors.dart';

class TradeMenu extends StatefulWidget {
  final bool isOpned;
  final Function(bool, Function) onClose;
  const TradeMenu({super.key, required this.isOpned, required this.onClose});

  @override
  State<TradeMenu> createState() => _TradeMenuState();
}

class _TradeMenuState extends State<TradeMenu> {
  bool isClosed = false;
  late List<DataTum> tradeOptions;
  @override
  void initState() {
    tradeOptions = [
      DataTum(title: "Buy"),
      DataTum(title: "Sell"),
      DataTum(title: "Swap"),
      DataTum(title: "Send"),
      DataTum(title: "Recieve"),
      DataTum(title: "Invest", showTag: true),
      DataTum(title: "Roqq’n’roll", showTag: true),
      DataTum(title: "Savings"),
      DataTum(
        title: "Savings",
        image: "assets/buy.png",
        imageColor: AppColors.indicatorBlue,
      ),
      DataTum(title: "Missions", showTag: true),
      DataTum(
        title: "Copy trading",
        showTag: true,
        onTap: () {
          if (isClosed) {
            return;
          }
          isClosed = true;
          widget.onClose(true, () {
            isClosed = false;
            AppRouter.navigateTo(CopyTradeDashBoardChoiceSelector());
          });
        },
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<DataTum> tradeSection = tradeOptions.take(6).toList();
    final List<DataTum> earnSection = tradeOptions.skip(6).take(5).toList();
    return SafeArea(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        height: widget.isOpned ? context.deviceHeight * 0.77 : 0.0,
        padding: widget.isOpned
            ? EdgeInsets.symmetric(horizontal: 14, vertical: 12) +
                  EdgeInsets.only(bottom: 0)
            : EdgeInsets.all(0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: AppColors.scaffoldBgColor,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(12),
              Text(
                "Trade",
                style: header.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  color: AppColors.iconGrey,
                ),
              ),
              Gap(12),
              AppBorderContainer(
                horizontalPadding: 0,
                verticalPadding: 0,
                child: ListView.builder(
                  padding: EdgeInsets.all(0),
                  itemCount: tradeSection.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Column(
                    children: [
                      TradeMenuActions(model: tradeOptions[index]),
                      index == (tradeSection.length - 1)
                          ? SizedBox()
                          : Divider(
                              color: AppColors.primaryColor.withValues(
                                alpha: 0.03,
                              ),
                            ),
                    ],
                  ),
                ),
              ),

              Gap(20),
              Text(
                "Earn",
                style: header.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  color: AppColors.iconGrey,
                ),
              ),
              Gap(12),
              AppBorderContainer(
                horizontalPadding: 0,
                verticalPadding: 0,
                child: ListView.builder(
                  padding: EdgeInsets.all(0),
                  itemCount: earnSection.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Column(
                    children: [
                      TradeMenuActions(model: earnSection[index]),
                      index == (earnSection.length - 1)
                          ? SizedBox()
                          : Divider(
                              color: AppColors.primaryColor.withValues(
                                alpha: 0.03,
                              ),
                            ),
                    ],
                  ),
                ),
              ),
              Gap(4),
            ],
          ),
        ),
      ),
    );
  }
}

class TradeMenuActions extends StatelessWidget {
  final DataTum model;
  const TradeMenuActions({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return AppInkWell(
      onTap: () {
        if (model.onTap == null) {
          return;
        } else {
          model.onTap!();
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenPaddding, vertical: 6),
        child: Row(
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: AppColors.updateGrey,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  model.image ?? "assets/trade.png",
                  height: 14,
                  color: model.imageColor,
                ),
              ),
            ),

            Gap(8),
            Expanded(
              child: Text(
                model.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14, color: AppColors.primaryColor),
              ),
            ),
            if (model.showTag) ...[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: AppColors.yellow2.withValues(alpha: 0.1),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 2.0),
                  child: Text("New", style: TextStyle(color: AppColors.yellow)),
                ),
              ),
              Gap(8),
            ],
            Image.asset("assets/forward_arrow.png", height: 20),
          ],
        ),
      ),
    );
  }
}

class DataTum {
  final String title;
  final bool showTag;
  final String? image;
  final Color? imageColor;
  final Function()? onTap;
  DataTum({
    required this.title,
    this.showTag = false,
    this.image,
    this.onTap,
    this.imageColor,
  });
}
