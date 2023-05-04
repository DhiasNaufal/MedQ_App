import 'package:cdss_quiz/configs/configs.dart';
import 'package:cdss_quiz/screens/home/home_screen.dart';
import 'package:cdss_quiz/widgets/common/main_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});
  static const String routeName = '/intro';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: cardcolorhome /*gradient: mainGradient(context)*/),
        alignment: Alignment.center,
        constraints: const BoxConstraints(maxWidth: kTabletChangePoint),
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        //alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 120,
                ),
                SvgPicture.asset('assets/images/whitestroke_logo.svg'),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 50, horizontal: 40),
                  child: Text(
                    'Selamat Datang di Aplikasi Pembelajaran Clinical Decision Support System (CDSS)',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: kOnSurfaceTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                ),
              ],
            ),
            MainButton(
              onTap: (() => Get.offAndToNamed(HomeScreen.routeName)),
              color: Colors.white,
              child: Center(
                child: Text("Masuk",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            // SizedBox(
            //   height: 120,
            // )
          ],
        ),
      ),
    );
  }
}
