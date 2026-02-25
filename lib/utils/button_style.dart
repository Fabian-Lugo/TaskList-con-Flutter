import 'package:flutter/material.dart';
import 'package:test_03/utils/color.dart';

class ButtonStyleContainers extends StatelessWidget {
  final String text ;

  const ButtonStyleContainers({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorApp.color_05,
        border: Border.all(color: ColorApp.color_07 , width: 0.5)
      ),
      child: Text(text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
    );
  }
}