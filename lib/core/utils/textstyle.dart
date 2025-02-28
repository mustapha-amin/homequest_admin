import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle kTextStyle(double fontSize,
    {bool isBold = false, Color color = Colors.black}) {
  return GoogleFonts.lato(
    fontSize: fontSize,
    color: color,
    fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
  );
}