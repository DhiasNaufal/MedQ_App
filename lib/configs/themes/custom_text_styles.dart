import 'package:cdss_quiz/configs/configs.dart';
import 'package:flutter/material.dart';

const kHomeHeader =
    TextStyle(fontSize: 35, color: kOnNetralColor, fontWeight: FontWeight.w100);

const titleTS = TextStyle(fontSize: 25, fontWeight: FontWeight.w600);
//const kOnNickName = TextStyle()

const kHeaderTS = TextStyle(
    fontSize: 22, fontWeight: FontWeight.w700, color: kOnSurfaceTextColor);

const detailsTS = TextStyle(fontSize: 16, fontWeight: FontWeight.w100);

TextStyle cardTitleTs(context) => TextStyle(
    color: UIParameters.isDarkMode(context)
        ? Theme.of(context).textTheme.bodyText1!.color
        : Theme.of(context).textTheme.bodyText1!.color,
    fontSize: 20,
    fontWeight: FontWeight.w200);

const kQuizeTS = TextStyle(
    fontSize: 16, fontWeight: FontWeight.w800, color: kPrimaryDarkColor);

const kAppBarTS = TextStyle(
    fontWeight: FontWeight.bold, fontSize: 16, color: kOnSurfaceTextColor);

TextStyle countDownTimerTs(context) => TextStyle(
    letterSpacing: 2,
    color: UIParameters.isDarkMode(context)
        ? Theme.of(context).textTheme.bodyText1!.color
        : Theme.of(context).primaryColor,
    fontSize: 16,
    fontWeight: FontWeight.bold);

const kQuizeNumberCardTs = TextStyle(
    fontSize: 16, fontWeight: FontWeight.w500, color: kOnSurfaceTextColor);
