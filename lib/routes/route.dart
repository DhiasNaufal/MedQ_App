import 'package:cdss_quiz/screens/home/custom_drawer.dart';
import 'package:cdss_quiz/screens/intro/intro_screen.dart';
import 'package:cdss_quiz/screens/screens.dart';
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
        ),
        GetPage(
          name: CustomDrawer.routeName,
          page: () => CustomDrawer(),
        )
      ];
}
