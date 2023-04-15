import 'package:cdss_quiz/base/initial_binding.dart';
import 'package:cdss_quiz/firebase_options.dart';
import 'package:cdss_quiz/routes/route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/*===== Main Fuction =====*/
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBinding().dependencies();

  //Initializing Firebase
  await initFireBase();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'CDSS Quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: AppRoutes.pages(),
    );
  }
}

/*Initialized Firebase Funtion*/
Future<void> initFireBase() async {
  await Firebase.initializeApp(
    name: 'Quiz-CDSS',
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
