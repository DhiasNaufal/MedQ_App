import 'package:cdss_quiz/configs/configs.dart';
import 'package:flutter/material.dart';

const Color primaryColorLT = Color(0xFF006A60);
const Color secondaryColorLT = Color(0xFF005048);
const Color tertiaryColorLT = Color(0xFFDAE5E1);
const Color accentColorLT = Color(0xFF00201C);
const Color scaffoldBackgroundColorLT = Color(0xFFFAFDFB);
const Color mainTextColorLT = Colors.black;
const Color kOnSecondaryContainer = Color(0xFF05201C);
const Color kOnSecondaryColort = Color(0xFF00201C);
const Color primaryColorLigtherLT = Color(0xFF005048);

const mainGradientLT = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      primaryColorLigtherLT,
      primaryColorLT,
    ]);

class LightTheme with SubThemeData {
  ThemeData buildLightTheme() {
    final ThemeData systemLightTheme = ThemeData.light();
    return systemLightTheme.copyWith(
        primaryColor: primaryColorLT,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: scaffoldBackgroundColorLT,
        iconTheme: getIconTheme().copyWith(color: const Color(0xFF191C1B)),
        splashColor: primaryColorLT.withOpacity(0.1),
        highlightColor: primaryColorLT.withOpacity(0.05),
        splashFactory: InkRipple.splashFactory,
        textTheme: getTextThemes().apply(
            bodyColor: mainTextColorLT, displayColor: kOnSecondaryContainer),
        cardColor: tertiaryColorLT,
        colorScheme: ColorScheme.fromSwatch(
            accentColor: Color(0xFF006A60), primarySwatch: Colors.green));
  }
}
