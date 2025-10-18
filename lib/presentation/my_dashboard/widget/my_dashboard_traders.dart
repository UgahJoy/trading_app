// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/constants.dart';
import 'package:trading_app/helper_files/helper_function.dart';
import 'package:trading_app/models/all_copy_traders_model.dart';
import 'package:trading_app/models/pro_traders_model.dart';
import 'package:trading_app/repositories/global_repository.dart';
import 'package:trading_app/shared_state/app_state.dart';
import 'package:trading_app/shared_widgets/all_traders_details.dart';
import 'package:trading_app/shared_widgets/app_border_conatiner_2.dart';
import 'package:trading_app/shared_widgets/app_textfield.dart';

class MyDashboardTraders extends ConsumerStatefulWidget {
  final ProTradersModel? model;
  const MyDashboardTraders({super.key, this.model});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MyDashboardTradersState();
}

class _MyDashboardTradersState extends ConsumerState<MyDashboardTraders> {
  bool isBusy = true;

  @override
  void initState() {
    isBusy = ref.read(appState).allCopyTraders.isEmpty;
    if (isBusy) {
      ref
          .read(globalRepository)
          .fectAllCopyTraders(widget.model?.leadPortfolioId ?? "")
          .then((val) {
            isBusy = false;
            if (mounted) {
              setState(() {});
            }
          });
    }
    super.initState();
  }

  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final List<AllCopyTradersModel> allTradersList =
        ref.watch(appState).allCopyTraders[widget.model?.leadPortfolioId] ?? [];

    var searchResult = allTradersList
        .where(
          (e) => e.nickname.toString().toLowerCase().contains(
            searchController.text.toLowerCase(),
          ),
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
              itemBuilder: (context, index) => AllTradersDetails(
                bgColor: generateRandomColor(index),
                model: searchResult[index],
                color: generateRandomColor(index),
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
