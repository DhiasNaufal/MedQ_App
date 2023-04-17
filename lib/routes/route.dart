import 'package:cdss_quiz/controllers/controllers.dart';
import 'package:cdss_quiz/screens/home/custom_drawer.dart';
import 'package:cdss_quiz/screens/intro/intro_screen.dart';
import 'package:cdss_quiz/screens/screens.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class AppRoutes {
  static List<GetPage> pages() => [
        GetPage(
          name: SplashScreen.routeName,
          page: () => SplashScreen(),
        ),
        GetPage(
          name: IntroScreen.routeName,
          page: () => IntroScreen(),
        ),
        GetPage(
            name: HomeScreen.routeName,
            page: () => HomeScreen(),
            binding: BindingsBuilder(() {
              Get.put(MyDrawerController());
              Get.put(QuizPaperController());
            })),
        GetPage(
          name: CustomDrawer.routeName,
          page: () => CustomDrawer(),
        )
      ];
}
