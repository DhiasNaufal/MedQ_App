import 'package:cdss_quiz/configs/configs.dart';
import 'package:flutter/material.dart';

const Color primaryColorLT = Color(0xFF006A60);
const Color scaffoldBackgroundColorLT = Color(0xFFFAFDFB);
const Color mainTextColorLT = Colors.black;
const Color cardColorLT = Color(0xFFDAE5E1);

const Color kOnSecondaryContainer = Color(0xFF05201C);

const Color kOnSecondaryColort = Color(0xFF00201C);
const Color kSecondaryColort = Color(0xFFDAE5E1);

const Color primaryLightColorLT = Color(0xFFB5C4FF);

const Color secondaryColorLT = Color(0xFF405AA9);
const Color secondaryLightColorLT = Color(0xFF405AA9);
const Color appBarIconColorLT = Colors.white;
//Color.fromARGB(255, 40, 40, 40);
const Color iconColorLT = Colors.white;
const Color shadowColorLT = Color.fromARGB(90, 172, 172, 172);

const Color cardcolorhome = Color(0xFF405AA9);

class LightTheme with SubThemeData {
  ThemeData buildLightTheme() {
    final ThemeData systemLightTheme = ThemeData.light();
    return systemLightTheme.copyWith(
      primaryColor: primaryColorLT,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: scaffoldBackgroundColorLT,
      iconTheme: getIconTheme().copyWith(color: Color(0xFF191C1B)),
      splashColor: primaryColorLT.withOpacity(0.1),
      highlightColor: primaryColorLT.withOpacity(0.05),
      splashFactory: InkRipple.splashFactory,
      textTheme: getTextThemes().apply(
          bodyColor: mainTextColorLT, displayColor: kOnSecondaryContainer),
      cardColor: cardColorLT,
    );
  }
}
