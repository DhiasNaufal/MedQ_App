import 'package:cdss_quiz/configs/configs.dart';
import 'package:flutter/material.dart';

const Color primaryColorDT = Color(0xFF53DBC9); //Color(0xFFCCE8E2);
const Color scaffoldBackgroundColorDT = Color(0xFF191C1B);
const Color mainTextColorDT = Colors.white;
const Color cardColorDT = Color(0xFF1C3531);
const Color customPrimaryButtonDT = Color(0xFF334B47);

const Color primaryLightColorDT = Color(0xFF5A73C4);
const Color appBarIconColorDT = Colors.white;

const Color iconColorDT = Colors.white;
const Color shadowColorDT = Color.fromARGB(90, 172, 172, 172);

class DarkTheme with SubThemeData {
  ThemeData buildDarkTheme() {
    final ThemeData systemLightTheme = ThemeData.dark();
    return systemLightTheme.copyWith(
        primaryColor: primaryColorDT,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: scaffoldBackgroundColorDT,
        iconTheme: getIconTheme(),
        splashColor: primaryColorLT.withOpacity(0.1),
        highlightColor: primaryColorLT.withOpacity(0.05),
        splashFactory: InkRipple.splashFactory,
        textTheme: getTextThemes()
            .apply(bodyColor: mainTextColorDT, displayColor: mainTextColorDT),
        cardColor: cardColorDT);
  }
}
