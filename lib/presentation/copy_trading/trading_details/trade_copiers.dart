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
import 'package:trading_app/shared_widgets/app_loader.dart';
import 'package:trading_app/shared_widgets/empty_state_widget.dart';
import 'package:trading_app/shared_widgets/all_traders_details.dart';
import 'package:trading_app/shared_widgets/app_border_container.dart';
import 'package:trading_app/shared_widgets/app_textfield.dart';

class TradeCopiers extends ConsumerStatefulWidget {
  final ProTradersModel model;
  const TradeCopiers({super.key, required this.model});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TradeCopiersState();
}

class _TradeCopiersState extends ConsumerState<TradeCopiers> {
  bool isBusy = true;

  @override
  void initState() {
    isBusy =
        (ref.read(appState).allCopyTraders[widget.model.leadPortfolioId] ?? [])
            .isEmpty;
    if (isBusy) {
      ref
          .read(globalRepository)
          .fectAllCopyTraders(widget.model.leadPortfolioId ?? "")
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
        ref.watch(appState).allCopyTraders[widget.model.leadPortfolioId] ?? [];

    var searchResult = allTradersList
        .where(
          (e) => e.nickname.toString().toLowerCase().contains(
            searchController.text.toLowerCase(),
          ),
        )
        .toList();

    return SingleChildScrollView(
      child: AppBorderContainer(
        borderRadius: 0,
        horizontalPadding: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(16),

            AppTextfield(
              hintText: "Search for copiers",
              onChanged: (val) {
                setState(() {});
              },
              onTap: () {},
              controller: searchController,
            ),
            Gap(20),

            isBusy
                ? AppLoader()
                : searchResult.isEmpty
                ? Center(child: EmptyStateWidget())
                : ListView.builder(
                    padding: EdgeInsets.only(left: 0),
                    itemCount: searchResult.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => AllTradersDetails(
                      showTag: false,
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
