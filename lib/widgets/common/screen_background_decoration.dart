import 'package:cdss_quiz/configs/configs.dart';
import 'package:flutter/material.dart';

class BackgroundDecoration extends StatelessWidget {
  const BackgroundDecoration(
      {Key? key, required this.child, this.showGradient = false})
      : super(key: key);

  final Widget child;
  final bool showGradient;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: Container(
          decoration: BoxDecoration(
              color: customQuizBackgroundColor(context),
              gradient: showGradient ? mainGradient(context) : null),
        )),
        Positioned.fill(child: SafeArea(child: child))
      ],
    );
  }
}
