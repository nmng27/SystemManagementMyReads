import 'package:flutter/services.dart';

class TextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final regex = RegExp(r"^[A-Za-z\s]*$"); // * permite vazio
    if (regex.hasMatch(newValue.text)) {
      return newValue;
    }
    return oldValue;
  }
}

class EmailFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final regex = RegExp(r"^[A-Za-z0-9@._-]*$"); 
    if (regex.hasMatch(newValue.text)) {
      return newValue;
    }
    return oldValue;
  }
}

class PhoneFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String numbersOnly = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (numbersOnly.length > 11) numbersOnly = numbersOnly.substring(0, 11);

    String formatted = '';
    int selectionIndex = newValue.selection.end;

    if (numbersOnly.length >= 1) formatted += '(';
    if (numbersOnly.length >= 2) formatted += numbersOnly.substring(0, 2) + ') ';
    if (numbersOnly.length > 2 && numbersOnly.length <= 6) {
      formatted += numbersOnly.substring(2);
    } else if (numbersOnly.length > 6) {
      formatted += numbersOnly.substring(2, 7) + '-' + numbersOnly.substring(7);
    }

    selectionIndex = formatted.length;

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}


class PasswordFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final regex = RegExp(r'^[A-Za-z0-9!@#$%^&*()_+=-]*$');
    if (regex.hasMatch(newValue.text)) return newValue;
    return oldValue;
  }
}
