import 'package:cdss_quiz/controllers/controllers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

import '../../firebase/references.dart';

class MyDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();
  Rxn<User?> user = Rxn();

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  void signOut() {
    Get.find<AuthController>().signOut();
  }

  void signIn() {
    Get.find<AuthController>().navigateToLogin();
  }

  @override
  void onReady() {
    user.value = Get.find<AuthController>().getUser();
    super.onReady();
  }

  void getTotalScore() {
    User? user = Get.find<AuthController>().getUser();
    userFR.doc(user!.email).get();
  }
}
