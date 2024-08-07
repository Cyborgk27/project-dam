import 'package:flutter/material.dart';

class StyleInputDecoration {
  static InputDecoration inputDecoration({
    required String hintText,
    required String labelText,
    required Icon icon}) {
      return InputDecoration(
        hintText: hintText,
        labelText: labelText,
        prefixIcon: icon
      );
    }
}