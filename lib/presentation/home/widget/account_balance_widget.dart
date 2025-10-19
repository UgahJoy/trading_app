import 'package:flutter/material.dart';
import 'package:trading_app/helper_files/extensions.dart';
import 'package:trading_app/shared_widgets/animated_text_widget.dart';
import 'package:trading_app/theme/app_textstyle.dart';

class AccountBalanceWidget extends StatelessWidget {
  const AccountBalanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "£0",
        style: header.copyWith(fontSize: 32, height: 1.25),
        children: [
          TextSpan(
            text: ".00",
            style: header.copyWith(fontSize: 12, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

class AnimatedBalanceWidget extends StatefulWidget {
  final ScrollController scrollController;
  const AnimatedBalanceWidget({super.key, required this.scrollController});

  @override
  State<AnimatedBalanceWidget> createState() => _AnimatedBalanceWidgetState();
}

class _AnimatedBalanceWidgetState extends State<AnimatedBalanceWidget> {
  @override
  void initState() {
    widget.scrollController.addListener(() {
      double scrollOffSet = widget.scrollController.offset;

      if (scrollOffSet >= 70) {
        Future.delayed(Duration(milliseconds: 300), () {
          showBalance = true;
          setState(() {});
        });
      } else {
        Future.delayed(Duration(milliseconds: 300), () {
          showBalance = false;
          setState(() {});
        });
      }
    });

    super.initState();
  }

  bool showBalance = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      alignment: Alignment.center,
      width: showBalance ? context.deviceWidth : 0,
      height: showBalance ? 16 : 0,
      margin: EdgeInsets.only(bottom: 12),
      duration: Duration(milliseconds: 400),
      child: AnimatedTextWidget(text: "£0", targetSize: showBalance ? 12 : 0),
    );
  }
}
