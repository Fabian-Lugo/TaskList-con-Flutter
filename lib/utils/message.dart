import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_03/utils/color.dart';

class MessageFloat {
  static void custom({required BuildContext context, required Color color, required String text}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 1),
        content: Text(
          text,
          style: GoogleFonts.poppins(color: ColorApp.color_02, fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
    );
  }
}