import 'package:flutter/material.dart';
import 'package:cdss_quiz/configs/configs.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ======= Light Mode Color ======= //
const Color kBackgroundLightMode = Color(0xFFFAFDFB);
const Color kContentAreaLightMode = Color(0xFF006A60);
// ======= Accent Color ======= //
const Color accentColorLT = Color(0xFF00201C);
const Color accentColorDT = Color(0xFF53DBC9);
// ======= Night Mode Color ======= //
const Color kBackgroundNightMode = Color(0xFF191C1B);
const Color kDarkModeLigher = Color(0xFF1C3531);
const kOnNetralColor = Colors.black;
const kOnprimaryLightColor = Color(0xFF405AA9);
const kLighterPrimaryColor = Color(0xFFDCE1FF);
const kPrimaryDarkColor = Color(0xFF00164E);
const kSecondaryColor = Color(0xFFFFB957);

const kSelectedAnswer = Color(0xFFB5C4FF);

const kOnSurfaceTextColor = Colors.white;
const kCorrectAnswerColor = Color(0xFF71C582);
const kWrongAnswerColor = Color(0xFFA43A3F);
const kNotAnswerColor = Color.fromARGB(255, 120, 50, 80);

const mainGradientLT = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF003731),
      Color(0xFF00A293),
    ]);

const mainGradientDT = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      kBackgroundNightMode,
      kDarkModeLigher,
    ]);

LinearGradient mainGradient(BuildContext context) =>
    UIParameters.isDarkMode(context) ? mainGradientDT : mainGradientLT;

Color accentColor(BuildContext context) =>
    UIParameters.isDarkMode(context) ? accentColorDT : accentColorLT;

Color customPrimaryButton(BuildContext context) =>
    UIParameters.isDarkMode(context) ? customPrimaryButtonDT : primaryColorLT;

Color customOnHomeBackgroundColor(BuildContext context) =>
    UIParameters.isDarkMode(context) ? Colors.white : Colors.black;

Color customHomeBackgroundColor(BuildContext context) =>
    UIParameters.isDarkMode(context)
        ? const Color(0xFF191C1B)
        : Color(0xFFFAFDFB);

Color customQuizBackgroundColor(BuildContext context) =>
    UIParameters.isDarkMode(context)
        ? Color(0xFF1C3531)
        : const Color(0xFF005048);

Color customContentHomeColor(BuildContext context) =>
    UIParameters.isDarkMode(context)
        ? const Color(0xFFCCE8E2)
        : const Color(0xFF006A60);

Color customContentQuizColor(BuildContext context) =>
    UIParameters.isDarkMode(context)
        ? const Color(0xFFCCE8E2)
        : const Color(0xFFDAE5E1);

Color answerBorderColor(BuildContext context) =>
    UIParameters.isDarkMode(context)
        ? const Color.fromARGB(255, 221, 221, 221)
        : const Color.fromARGB(255, 221, 221, 221);

Color customQuizAction(BuildContext context) => UIParameters.isDarkMode(context)
    ? const Color(0xFF334B47)
    : const Color(0xFF006A60);

Color customsvg(BuildContext context) => UIParameters.isDarkMode(context)
    ? const Color(0xFFE6F1EF)
    : const Color(0xFFDAE5E1);
Color answerSelectedColor(BuildContext context) =>
    Theme.of(context).primaryColor;
