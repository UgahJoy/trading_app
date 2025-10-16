import 'package:animate_icons/animate_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:trading_app/shared_widgets/app_InkWell.dart';
import 'package:trading_app/theme/colors.dart';

class AppNavBar extends StatefulWidget {
  const AppNavBar({super.key});

  @override
  State<AppNavBar> createState() => _AppNavBarState();
}

class _AppNavBarState extends State<AppNavBar> {
  int currentIndex = 0;
  final AnimateIconController controller = AnimateIconController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.navGrey),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: NavBarItems(
                  image: "assets/home.png",
                  onTap: () {
                    setState(() {
                      currentIndex = 0;
                    });
                  },
                  text: "Home",
                  index: 0,
                  currentIndex: currentIndex,
                ),
              ),
              Expanded(
                child: NavBarItems(
                  image: "assets/wallet.png",
                  onTap: () {
                    setState(() {
                      currentIndex = 1;
                    });
                  },
                  text: "Wallet",
                  index: 1,
                  currentIndex: currentIndex,
                ),
              ),

              SizedBox(
                width: 60,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [AppColors.blue1, AppColors.blue2],
                        ),
                      ),
                      child: Center(
                        child: AnimateIcons(
                          startIcon: IconsaxPlusLinear.category,
                          endIcon: Icons.clear,

                          controller: controller,

                          size: 24.0,
                          onStartIconPress: () {
                            return true;
                          },
                          onEndIconPress: () {
                            return true;
                          },
                          duration: Duration(milliseconds: 500),
                          startIconColor: AppColors.primaryColor,
                          endIconColor: AppColors.primaryColor,
                          clockwise: false,
                        ),
                      ),
                    ),
                    Gap(20),

                    Text(' ', style: TextStyle(color: AppColors.transparent)),
                  ],
                ),
              ),

              Expanded(
                child: NavBarItems(
                  image: "assets/transaction.png",
                  onTap: () {
                    setState(() {
                      setState(() {
                        currentIndex = 2;
                      });
                    });
                  },
                  text: "History",
                  index: 2,
                  currentIndex: currentIndex,
                ),
              ),
              Expanded(
                child: NavBarItems(
                  image: "assets/profile.png",
                  onTap: () {
                    setState(() {
                      currentIndex = 3;
                    });
                  },
                  text: "Profile",
                  index: 3,
                  currentIndex: currentIndex,
                ),
              ),
            ],
          ),
          Gap(20),
        ],
      ),
    );
  }
}

class NavBarItems extends StatelessWidget {
  final String image;
  final String text;
  final Function() onTap;
  final int index;
  final int currentIndex;
  const NavBarItems({
    super.key,
    required this.image,
    required this.onTap,
    required this.text,
    required this.index,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return AppInkWell(
      onTap: onTap,
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                image,
                height: 24,
                color: index == currentIndex
                    ? AppColors.primaryColor
                    : AppColors.iconGrey,
              ),
              index == 0
                  ? Positioned(
                      right: 0,
                      top: 4,
                      child: Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.yellow,
                        ),
                      ),
                    )
                  : SizedBox(),
            ],
          ),
          Gap(8),
          Align(
            alignment: AlignmentGeometry.center,
            child: Text(
              text,
              style: TextStyle(
                color: index == currentIndex
                    ? AppColors.primaryColor
                    : AppColors.iconGrey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
