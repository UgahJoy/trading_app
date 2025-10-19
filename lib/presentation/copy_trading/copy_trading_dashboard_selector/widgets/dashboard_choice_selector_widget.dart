import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trading_app/helper_files/extensions.dart';
import 'package:trading_app/shared_widgets/app_Inkwell.dart';
import 'package:trading_app/theme/app_textstyle.dart';
import 'package:trading_app/theme/colors.dart';

class DashboardChoiceSelectorWidget extends StatelessWidget {
  final List<Color> colors;
  final List<Color>? colors2;
  final List<double>? stops;
  final String image;
  final String title;
  final String caption;
  final Function() onTap;
  const DashboardChoiceSelectorWidget({
    super.key,
    required this.caption,
    required this.colors,
    this.stops,
    required this.image,
    this.colors2,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppInkWell(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: colors),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              right: -context.deviceWidth * 0.04,
              top: -10,
              bottom: -70,
              child: Transform.rotate(
                angle: 0.85,
                child: Container(
                  width: context.deviceWidth * 0.33,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors:
                          colors2 ??
                          [
                            AppColors.tradingDashboardGradient1.withValues(
                              alpha: 0.6,
                            ),
                            AppColors.tradingDashboardGradient2,
                            AppColors.tradingDashboardGradient3,
                          ],
                      stops: stops ?? [0.0, 0.5, 1.0],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.updateGrey,
                    ),
                    child: Center(child: Image.asset(image, height: 19)),
                  ),
                  Gap(30),

                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: header2.copyWith(
                      fontSize: 12,

                      color: AppColors.scaffoldBgColor,
                    ),
                  ),
                  Gap(4),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          caption,
                          style: TextStyle(color: AppColors.navGrey),
                        ),
                      ),
                      Image.asset(
                        "assets/forward_arrow.png",
                        color: AppColors.scaffoldBgColor,
                        height: 18,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
