import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class MyDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();
  //Rxn<User?> user = Rxn();
  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
