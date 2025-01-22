import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle textStyle({
  required Color color,
  required double fontSize,
  required FontWeight fontWeight,
}) {
  {
    return GoogleFonts.lato(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }
}
//bold style
TextStyle boldstyle({
  Color color = Colors.white,
  double fontSize = 24,
}) => textStyle(
  color: color,
   fontSize: fontSize,
    fontWeight: FontWeight.bold);

//bold style
TextStyle regularstyle({
  Color color = Colors.white,
  double fontSize = 24,
}) =>
    textStyle(color: color, fontSize: fontSize, fontWeight: FontWeight.normal);
