import 'package:flutter/material.dart';
import 'package:cdss_quiz/configs/configs.dart';

const kOnSurfaceTextColor = Colors.white;
const kCorrectAnswerColor = Color.fromARGB(255, 0, 188, 100);
const kWrongAnswerColor = Color.fromARGB(255, 230, 24, 24);
const kNotAnswerColor = Color.fromARGB(255, 120, 50, 80);

const mainGradientLT = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryColorLT, primaryLightColorLT]);

const mainGradientDT = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      primaryLightColorDT,
      primaryColorDT,
    ]);

LinearGradient mainGradient(BuildContext context) =>
    UIParameters.isDarkMode(context) ? mainGradientDT : mainGradientLT;
Color customScaffoldColor(BuildContext context) =>
    UIParameters.isDarkMode(context)
        ? const Color.fromARGB(255, 14, 20, 44)
        : const Color.fromARGB(255, 240, 237, 255);
Color answerBorderColor(BuildContext context) =>
    UIParameters.isDarkMode(context)
        ? const Color.fromARGB(255, 20, 46, 158)
        : const Color.fromARGB(255, 221, 221, 221);

Color answerSelectedColor(BuildContext context) =>
    Theme.of(context).primaryColor;
