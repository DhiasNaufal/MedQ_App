import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});
  static const String routeName = '/intro';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Container(alignment: Alignment.center, child: Text("ini baru intro")),
    );
  }
}
