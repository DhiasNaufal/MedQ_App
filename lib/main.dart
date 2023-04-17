import 'package:cdss_quiz/base/initial_binding.dart';
import 'package:cdss_quiz/controllers/theme/theme_controller.dart';
import 'package:cdss_quiz/firebase_options.dart';
import 'package:cdss_quiz/routes/route.dart';
import 'package:cdss_quiz/screens/screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/*===== Main Fuction =====*/
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBinding().dependencies();

  //Initializing Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'CDSS Quiz',
      theme: Get.find<ThemeController>().getLightheme(),
      darkTheme: Get.find<ThemeController>().getDarkTheme(),
      getPages: AppRoutes.pages(),
    );
  }
}

/*Initialized Firebase Function*/
// Future<void> initFireBase() async {
//   await Firebase.initializeApp(
//     name: 'quizzle-demo',
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
// }

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(GetMaterialApp(
//     home: DataUploaderScreen(),
//   ));
// }
