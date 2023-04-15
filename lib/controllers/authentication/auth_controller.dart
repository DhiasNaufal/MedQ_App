import 'package:cdss_quiz/screens/home/custom_drawer.dart';
import 'package:cdss_quiz/screens/home/home_screen.dart';
import 'package:cdss_quiz/screens/intro/intro_screen.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    initAuth();
    super.onReady();
  }
}

void initAuth() async {
  await Future.delayed(const Duration(seconds: 2));
  navigateToIntroduction();
}

void navigateToIntroduction() {
  Get.offAllNamed(HomeScreen.routeName);
}
