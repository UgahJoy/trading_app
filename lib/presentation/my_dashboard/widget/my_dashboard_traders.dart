// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/all_traders_details_datum.dart';
import 'package:trading_app/helper_files/constants.dart';
import 'package:trading_app/shared_widgets/all_traders_details.dart';
import 'package:trading_app/shared_widgets/app_textfield.dart';
import 'package:trading_app/theme/colors.dart';

class MyDashboardTraders extends StatefulWidget {
  const MyDashboardTraders({super.key});

  @override
  State<MyDashboardTraders> createState() => _MyDashboardTradersState();
}

class _MyDashboardTradersState extends State<MyDashboardTraders> {
  List<AllTradersDetailsDaTum> traders = [
    AllTradersDetailsDaTum(
      bgColor: AppColors.proTradersBlue1,
      color: AppColors.proTradersBlue,
      name: "Jaykay Kayode",
    ),
    AllTradersDetailsDaTum(
      bgColor: AppColors.proTradersYellow,
      name: "Okobi Laura",
      color: AppColors.proTradersYellow,
    ),
    AllTradersDetailsDaTum(
      bgColor: AppColors.indicatorBlue,
      name: "Tosin Lasisi",
      color: AppColors.indicatorBlue,
    ),
  ];
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var searchResult = traders
        .where(
          (e) => e.name.toLowerCase().contains(
            searchController.text.toLowerCase(),
          ),
        )
        .toList();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
        border: Border(
          bottom: BorderSide(color: AppColors.navBorder),
          right: BorderSide(color: AppColors.navBorder),
          left: BorderSide(color: AppColors.navBorder),
        ),
        color: AppColors.navGrey,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(16),

            AppTextfield(
              onChanged: (val) {
                setState(() {});
              },
              onTap: () {},
              controller: searchController,
            ),
            Gap(20),
            ListView.builder(
              padding: EdgeInsets.only(left: 16),
              itemCount: searchResult.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => AllTradersDetails(
                bgColor: searchResult[index].bgColor,
                name: searchResult[index].name,
                color: searchResult[index].color,
                lastItem: (index < searchResult.length - 1),
              ),
            ),
            Gap(bottomPaddding),
          ],
        ),
      ),
    );
  }
}
