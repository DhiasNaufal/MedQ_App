import 'package:cdss_quiz/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:cdss_quiz/controllers/common/drawer_controller.dart';
import 'package:get/get.dart';

class CustomDrawer extends GetView<MyDrawerController> {
  const CustomDrawer({super.key});
  static const String routeName = '/drawer';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: mainGradient(context)),
      padding: UIParameters.screenPadding,
      child: Theme(
        data: ThemeData(
            textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                    foregroundColor: kOnSurfaceTextColor))),
        child: SafeArea(
            child: Stack(
          children: [
            BackButton(
              onPressed: (() {
                controller.toggleDrawer();
              }),
            )
          ],
        )),
      ),
    );
  }
}
