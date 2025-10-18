import 'package:flutter/services.dart';
import 'package:trading_app/helper_files/helper_function.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  static const String currencyCode = ' USD';

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text;

    String numericText = text.replaceAll(RegExp(r'[^\d]'), '');

    if (numericText.isEmpty) {
      return TextEditingValue.empty;
    }

    final formattedNumber = formatNumberWithCommas(numericText);

    String finalString = formattedNumber + currencyCode;

    return TextEditingValue(
      text: finalString,
      selection: TextSelection.collapsed(
        offset: finalString.length - currencyCode.length,
      ),
    );
  }
}
