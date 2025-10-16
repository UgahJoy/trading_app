import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trading_app/presentation/dashboard/widget/app_nav_bar.dart';
import 'package:trading_app/presentation/dashboard/widget/dashboard_app_bar.dart';
import 'package:trading_app/presentation/home/home.dart';
import 'package:trading_app/shared_widgets/app_scaffold.dart';
import 'package:trading_app/theme/colors.dart';

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      bottomNavigationBar: const AppNavBar(),
      horizontalScreenPadding: 0,
      top: false,
      bottom: false,

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            stops: [0.05, 0.6, 1.0],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              AppColors.dashboardGradient1,
              AppColors.dashboardGradient2,
              AppColors.dashboardGradient3,
            ],
          ),
        ),
        child: Column(
          children: [
            const DashboardAppBar(),
            Expanded(child: Home()),
          ],
        ),
      ),
    );
  }
}
