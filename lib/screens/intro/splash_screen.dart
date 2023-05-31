import 'package:cdss_quiz/configs/configs.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Image.asset(
          'assets/icons/MEDQ.png',
          height: UIParameters.getHeight(context) * 0.2,
        ),
      ),
    );
  }
}
