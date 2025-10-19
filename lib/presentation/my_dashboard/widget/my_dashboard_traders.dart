// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/constants.dart';
import 'package:trading_app/helper_files/helper_function.dart';
import 'package:trading_app/presentation/my_dashboard/widget/my_traders_widget.dart';
import 'package:trading_app/shared_widgets/app_border_conatiner_2.dart';
import 'package:trading_app/shared_widgets/app_textfield.dart';

class MyDashboardTraders extends ConsumerStatefulWidget {
  const MyDashboardTraders({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MyDashboardTradersState();
}

class _MyDashboardTradersState extends ConsumerState<MyDashboardTraders> {
  List<String> traderNames = ["Jaykay Kayode", "Okobi Laura", "Tosin Lasisi"];

  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var searchResult = traderNames
        .where(
          (e) => e.toLowerCase().contains(searchController.text.toLowerCase()),
        )
        .toList();
    return AppBorderContainer2(
      horizontalPadding: 0,
      verticalPadding: 0,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(16),

            AppTextfield(
              hintText: "Search for PRO traders",
              onChanged: (val) {
                setState(() {});
              },
              onTap: () {},
              controller: searchController,
            ),
            Gap(20),
            ListView.builder(
              itemCount: searchResult.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => MyTradersWidget(
                bgColor: generateRandomColor(index),
                tradersName: searchResult[index],
                isLastItem: index == (searchResult.length - 1),
              ),
            ),
            Gap(bottomPaddding),
          ],
        ),
      ),
    );
  }
}
