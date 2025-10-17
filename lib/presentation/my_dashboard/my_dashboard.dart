import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/constants.dart';
import 'package:trading_app/presentation/my_dashboard/my_dasboard_body.dart';
import 'package:trading_app/presentation/my_dashboard/widget/net_profit.dart';
import 'package:trading_app/shared_widgets/app_bar_item.dart';
import 'package:trading_app/shared_widgets/app_scaffold.dart';

class MyDashboard extends ConsumerStatefulWidget {
  const MyDashboard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyDashboardState();
}

class _MyDashboardState extends ConsumerState<MyDashboard> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        children: [
          Gap(topPadding),
          AppBarItem(text: "My dashboard"),

          Gap(30),
          NetProfit(),
          Gap(12),
          Expanded(child: SingleChildScrollView(child: MyDashboardBody())),
        ],
      ),
    );
  }
}
