import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/constants.dart';
import 'package:trading_app/theme/app_textstyle.dart';
import 'package:trading_app/theme/colors.dart';

class ListedCoinsConatiner extends StatefulWidget {
  const ListedCoinsConatiner({super.key});

  @override
  State<ListedCoinsConatiner> createState() => _ListedCoinsConatinerState();
}

class _ListedCoinsConatinerState extends State<ListedCoinsConatiner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: AppColors.navGrey,
        border: Border.all(color: AppColors.navBorder),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 0),
        shrinkWrap: true,
        itemCount: 10,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Column(
          children: [
            CoinItems(
              coinName: index % 2 == 0 ? "Bitcoin" : "Ethereum",
              nickName: index % 2 == 0 ? "BTC" : "ETH",
              image: index % 2 == 0 ? "assets/btc.png" : "assets/eth.png",
              pa: "-0.61%",
              rate: index % 2 == 0 ? "\$22,840" : "\$0.36",
            ),

            index == 9 ? SizedBox() : Divider(),
          ],
        ),
      ),
    );
  }
}

class CoinItems extends StatelessWidget {
  final String image;
  final String coinName;
  final String nickName;
  final String rate;
  final String pa;

  const CoinItems({
    super.key,
    required this.coinName,
    required this.image,
    required this.nickName,
    required this.pa,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenPaddding, vertical: 12),
      child: Row(
        children: [
          Image.asset(image, height: 32),
          Gap(20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coinName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: header2.copyWith(fontSize: 15),
                ),
                Gap(4),
                Text(nickName),
              ],
            ),
          ),
          Gap(20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                rate,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: header2.copyWith(fontSize: 15),
              ),
              Gap(4),
              Text(
                textAlign: TextAlign.end,
                pa,
                style: TextStyle(color: AppColors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
