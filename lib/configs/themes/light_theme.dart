import 'package:cdss_quiz/configs/configs.dart';
import 'package:flutter/material.dart';

const Color primaryLightColorLT = Color(0xFFB5C4FF);
const Color primaryColorLT = Color(0xFF405AA9);
const Color secondaryColorLT = Color(0xFF405AA9);
const Color secondaryLightColorLT = Color(0xFF405AA9);
const Color appBarIconColorLT = Colors.white;
const Color mainTextColorLT = Colors.white; //Color.fromARGB(255, 40, 40, 40);
const Color iconColorLT = Colors.white;
const Color shadowColorLT = Color.fromARGB(90, 172, 172, 172);
const Color cardColorLT = Colors.white; //Color(0xFF405AA9);
const Color scaffoldBackgroundColorLT = Color.fromARGB(255, 240, 237, 255);
const Color cardcolorhome = Color(0xFF405AA9);

class LightTheme with SubThemeData {
  ThemeData buildLightTheme() {
    final ThemeData systemLightTheme = ThemeData.light();
    return systemLightTheme.copyWith(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: scaffoldBackgroundColorLT,
      iconTheme: getIconTheme(),
      splashColor: primaryColorLT.withOpacity(0.1),
      highlightColor: primaryColorLT.withOpacity(0.05),
      splashFactory: InkRipple.splashFactory,
      textTheme: getTextThemes()
          .apply(bodyColor: mainTextColorLT, displayColor: mainTextColorLT),
      primaryColor: primaryColorLT,
      cardColor: cardcolorhome,
    );
  }
}
