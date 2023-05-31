import 'package:flutter/material.dart';
import 'package:cdss_quiz/configs/configs.dart';

const kSecondaryColor = Color(0xFFFFB957);

const kOnSurfaceTextColor = Colors.white;
const kCorrectAnswerColor = Color(0xFF71C582);
const kWrongAnswerColor = Color(0xFFA43A3F);
const kNotAnswerColor = Color.fromARGB(255, 120, 50, 80);

LinearGradient mainGradient(BuildContext context) =>
    UIParameters.isDarkMode(context) ? mainGradientDT : mainGradientLT;

Color customPrimaryButton(BuildContext context) =>
    UIParameters.isDarkMode(context) ? customPrimaryButtonDT : primaryColorLT;

Color customGoogleSignInButton(BuildContext context) =>
    UIParameters.isDarkMode(context) ? secondaryColorDT : primaryColorLT;

Color customOnHomeBackgroundColor(BuildContext context) =>
    UIParameters.isDarkMode(context) ? Colors.white : Colors.black;

Color customHomeBackgroundColor(BuildContext context) =>
    UIParameters.isDarkMode(context)
        ? const Color(0xFF191C1B)
        : const Color(0xFFFAFDFB);

Color customQuizBackgroundColor(BuildContext context) =>
    UIParameters.isDarkMode(context)
        ? const Color(0xFF1C3531)
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
