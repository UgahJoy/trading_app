import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/theme/colors.dart';

class TradeActions extends StatelessWidget {
  const TradeActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.navBorder),
            color: AppColors.navGrey,
          ),
          child: Row(
            children: [
              Expanded(
                child: ActionItems(
                  image: "assets/deposite.png",
                  onTap: () {},
                  text: "Deposit",
                ),
              ),
              Expanded(
                child: ActionItems(
                  image: "assets/buy.png",
                  onTap: () {},
                  text: "Buy",
                ),
              ),
              Expanded(
                child: ActionItems(
                  image: "assets/withdraw.png",
                  onTap: () {},
                  text: "Withdraw",
                ),
              ),
              Expanded(
                child: ActionItems(
                  image: "assets/sell.png",
                  onTap: () {},
                  text: "Sell",
                ),
              ),
            ],
          ),
        ),

        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
            border: Border(
              top: BorderSide.none,
              left: BorderSide(color: AppColors.navBorder),
              right: BorderSide(color: AppColors.navBorder),
              bottom: BorderSide(color: AppColors.navBorder),
            ),
            color: AppColors.navGrey,
          ),
          child: Text(
            "See more",
            style: TextStyle(
              color: AppColors.indicatorBlue,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}

class ActionItems extends StatelessWidget {
  final String image;
  final String text;
  final Function() onTap;
  const ActionItems({
    super.key,
    required this.onTap,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 56,
          width: 56,
          decoration: BoxDecoration(
            color: AppColors.scaffoldBgColor,
            shape: BoxShape.circle,
          ),
          child: Center(child: Image.asset(image, height: 24)),
        ),
        Gap(8),
        Text(text, maxLines: 1, overflow: TextOverflow.ellipsis),
      ],
    );
  }
}
