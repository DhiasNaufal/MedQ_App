import 'package:cdss_quiz/configs/configs.dart';
import 'package:flutter/material.dart';

class ContentArea extends StatelessWidget {
  final Widget child;
  final Color? color;
  final bool addPadding;

  const ContentArea({
    Key? key,
    required this.child,
    required this.color,
    this.addPadding = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      clipBehavior: Clip.hardEdge,
      type: MaterialType.transparency,
      child: Ink(
        decoration: BoxDecoration(
          color: color,
        ),
        padding: addPadding
            ? const EdgeInsets.only(
                top: kMobileScreenPadding,
                left: kMobileScreenPadding,
                right: kMobileScreenPadding)
            : EdgeInsets.zero,
        child: child,
      ),
    );
  }
}
