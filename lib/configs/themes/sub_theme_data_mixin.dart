import 'package:cdss_quiz/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

mixin SubThemeData {
  TextTheme getTextThemes() {
    return GoogleFonts.montserratTextTheme(TextTheme(
        bodyText1: TextStyle(fontWeight: FontWeight.w500),
        bodyText2: TextStyle(fontWeight: FontWeight.w500)));
  }

  IconThemeData getIconTheme() {
    return const IconThemeData(color: kOnSurfaceTextColor, size: 16);
  }
}
