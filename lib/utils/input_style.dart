import 'package:flutter/material.dart';

class InputStyles {
  static OutlineInputBorder customBorder({required Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: color,
      ),
    );
  }
}