import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_03/utils/color.dart';

class SocialButton extends StatelessWidget {
  final String iconPath;
  final VoidCallback onTap;
  const SocialButton({
    super.key,
    required this.onTap,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorApp.color_02,
          border: Border.all(color: ColorApp.color_07, width: 3),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(iconPath, width: 30),
          ],
        )
      ),
    );
  }
}