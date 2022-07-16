import 'package:flutter/material.dart';

//import '../utils/reference_utils.dart';

class CustomInputDecorator {
  static InputDecoration getStandardInputDecoration(BuildContext context,
      [bool invert = false]) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(5.0),
      ),
      borderSide: BorderSide(width: 2, color: Colors.black),
    );
    final style = TextStyle(
        color: Colors.black,
        fontSize: 20,
        letterSpacing: 5,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold);
    return InputDecoration(
      focusedBorder: border,
      enabledBorder: border,

      // errorBorder:
      //     border.copyWith(borderSide: BorderSide(color: Colors.red, width: 2)),
      // focusedErrorBorder: border.copyWith(
      //     borderSide: BorderSide(color: Colors.black, width: 2)),
      contentPadding: EdgeInsets.only(left: 10, right: 20),
      counterStyle: style,
      suffixStyle: style,
      errorStyle: style.copyWith(fontWeight: FontWeight.bold),
      helperStyle: style,
      hintStyle: style,
      labelStyle: style.copyWith(fontWeight: FontWeight.bold),
      prefixStyle: style,
    );
  }
}
