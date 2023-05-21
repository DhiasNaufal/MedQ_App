import 'package:cdss_quiz/configs/configs.dart';
import 'package:flutter/material.dart';

const Color primaryColorDT = Color(0xFF052978);
const Color primaryLightColorDT = Color(0xFF5A73C4);
const Color appBarIconColorDT = Colors.white;
const Color mainTextColorDT = Colors.white;
const Color iconColorDT = Colors.white;
const Color shadowColorDT = Color.fromARGB(90, 172, 172, 172);
const Color cardColorDT = Color.fromARGB(255, 28, 40, 84);
const Color scaffoldBackgroundColor = Color(0xFFFAFDFB);

class DarkTheme with SubThemeData {
  ThemeData buildDarkTheme() {
    final ThemeData systemLightTheme = ThemeData.dark();
    return systemLightTheme.copyWith(
        primaryColor: Color(0xFF53DBC9),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Color(0xFF191C1B),
        iconTheme: getIconTheme(),
        splashColor: primaryColorLT.withOpacity(0.1),
        highlightColor: primaryColorLT.withOpacity(0.05),
        splashFactory: InkRipple.splashFactory,
        textTheme: getTextThemes()
            .apply(bodyColor: mainTextColorLT, displayColor: mainTextColorLT),
        cardColor: Color(0xFF1C3531));
  }
}
