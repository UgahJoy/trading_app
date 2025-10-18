import 'package:flutter/material.dart';
import 'package:trading_app/helper_files/extensions.dart';
import 'package:trading_app/theme/app_textstyle.dart';
import 'package:trading_app/theme/colors.dart';

const int _pinMaxLength = 6;

class CustomeKeyPad extends StatelessWidget {
  final FocusNode focusNode;
  final Function(String) onchanged;
  final Function(String) onCompleted;
  final TextEditingController controller;

  const CustomeKeyPad({
    super.key,
    required this.onCompleted,
    required this.onchanged,
    required this.controller,
    required this.focusNode,
  });
  @override
  Widget build(BuildContext context) {
    return NumberKeypad(
      controller: controller,
      focusNode: focusNode,
      onchanged: onchanged,
      onCompleted: onCompleted,
    );
  }
}

class NumberKeypad extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController controller;
  final Function(String) onchanged;
  final Function(String) onCompleted;

  const NumberKeypad({
    super.key,
    required this.focusNode,
    required this.controller,
    required this.onchanged,
    required this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.deviceHeight * 0.45,
      width: context.deviceWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          KeypadRowItem(
            digits: ["1", "2", "3"],
            onKeyPress: (value) => _onKeyTap(value),
          ),
          KeypadRowItem(
            digits: ["4", "5", "6"],
            onKeyPress: (value) => _onKeyTap(value),
          ),
          KeypadRowItem(
            digits: ["7", "8", "9"],
            onKeyPress: (value) => _onKeyTap(value),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: KeyBoardItem(text: ".", onTap: () => _onKeyTap(".")),
                ),
                Expanded(
                  child: KeyBoardItem(text: "0", onTap: () => _onKeyTap("0")),
                ),
                Expanded(
                  child: KeyBoardItem(
                    image: "assets/arrow_back.png",
                    onTap: _onDeleteTap,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onKeyTap(String text) {
    focusNode.requestFocus();

    if (controller.text.length < _pinMaxLength) {
      final newText = controller.text + text;
      controller.value = controller.value.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length),
      );

      onchanged(newText);

      if (newText.length == _pinMaxLength) {
        onCompleted(newText);
      }
    }
  }

  void _onDeleteTap() {
    focusNode.requestFocus();

    String currentText = controller.text;
    if (currentText.isNotEmpty) {
      final newText = currentText.substring(0, currentText.length - 1);

      controller.value = controller.value.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length),
      );

      onchanged(newText);
    }
  }
}

class KeypadRowItem extends StatelessWidget {
  final List<String> digits;
  final Function(String value) onKeyPress;

  const KeypadRowItem({
    super.key,
    required this.digits,
    required this.onKeyPress,
  }) : assert(
         digits.length == 3,
         'KeypadRowItem must be initialized with exactly 3 values for the row layout.',
       ),
       super();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: KeyBoardItem(
              text: digits[0],
              onTap: () => onKeyPress(digits[0]),
            ),
          ),
          Expanded(
            child: KeyBoardItem(
              text: digits[1],
              onTap: () => onKeyPress(digits[1]),
            ),
          ),
          Expanded(
            child: KeyBoardItem(
              text: digits[2],
              onTap: () => onKeyPress(digits[2]),
            ),
          ),
        ],
      ),
    );
  }
}

class KeyBoardItem extends StatelessWidget {
  final String? text;
  final String? image;
  final Function() onTap;

  const KeyBoardItem({super.key, this.text, this.image, required this.onTap})
    : assert(
        text != null || image != null,
        'KeyBoardItem must have either text or icon.',
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.deviceHeight * 0.07,
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        splashColor: AppColors.transparent,
        highlightColor: AppColors.transparent,
        onTap: onTap,
        child: text != null
            ? FittedBox(
                fit: BoxFit.scaleDown,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(text!, textAlign: TextAlign.center, style: header2),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(22.0),
                child: Image.asset(
                  image ?? "assets/arrow_back.png",
                  height: 24,
                  color: AppColors.primaryColor,
                ),
              ),
      ),
    );
  }
}
