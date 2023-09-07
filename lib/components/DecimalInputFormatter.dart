import 'package:flutter/services.dart';

class DecimalInputFormatter extends TextInputFormatter {
  static const maxDecimalDigits = 3;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Allow deletion
    if (newValue.text.isEmpty) {
      return newValue;
    }

    // Allow only numbers and a single decimal point
    final regExp = RegExp(r'^\d*\.?\d*$');
    if (!regExp.hasMatch(newValue.text)) {
      return oldValue;
    }

    // Limit to three decimal digits
    final parts = newValue.text.split('.');
    if (parts.length > 1 && parts[1].length > maxDecimalDigits) {
      final truncatedValue =
          '${parts[0]}.${parts[1].substring(0, maxDecimalDigits)}';
      return TextEditingValue(
        text: truncatedValue,
        selection: TextSelection.collapsed(offset: truncatedValue.length),
      );
    }

    return newValue;
  }
}
