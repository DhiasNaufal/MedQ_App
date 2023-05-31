import 'package:cdss_quiz/configs/configs.dart';
import 'package:flutter/material.dart';

const Color primaryColorDT = Color(0xFF53DBC9);
const Color secondaryColorDT = Color(0xFFCCE8E2);
const Color tertiaryColorDT = Color(0xFF1C3531);
const Color accentColorDT = Color(0xFF334B47);
const Color scaffoldBackgroundColorDT = Color(0xFF191C1B);
const Color mainTextColorDT = Colors.white;
const Color customPrimaryButtonDT = Color(0xFF334B47);
const Color iconColorDT = Colors.white;
const Color shadowColorDT = Color.fromARGB(90, 172, 172, 172);

const mainGradientDT = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      scaffoldBackgroundColorDT,
      tertiaryColorDT,
    ]);

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
        cardColor: tertiaryColorDT);
  }
}
