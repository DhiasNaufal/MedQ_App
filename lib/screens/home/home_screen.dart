import 'package:cdss_quiz/configs/configs.dart';
import 'package:cdss_quiz/controllers/common/drawer_controller.dart';
import 'package:cdss_quiz/screens/home/custom_drawer.dart';
import 'package:cdss_quiz/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<MyDrawerController> {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MyDrawerController>(
        builder: (controller) => ZoomDrawer(
          controller: controller.zoomDrawerController,
          menuScreen: const CustomDrawer(),
          mainScreen: Container(
            decoration: BoxDecoration(gradient: mainGradient(context)),
            child: Column(children: [
              Transform.translate(
                offset: const Offset(-10, 0),
                child: CircularButton(
                  onTap: controller.toggleDrawer,
                  child: const Icon(AppIcons.menuleft),
                ),
              ),
              SizedBox(height: 10),
              Text("home"),
              const Text('What Do You Want To Improve Today ?'),
              //style: kHeaderTS),
              const SizedBox(height: 15),
            ]),
          ),
        ),
      ),
    );
  }
}
