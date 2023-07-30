import 'package:cdss_quiz/controllers/controllers.dart';
import 'package:cdss_quiz/controllers/profile/profile_controller.dart';
import 'package:cdss_quiz/screens/challenge/challenge_screen.dart';
import 'package:cdss_quiz/screens/home/custom_drawer.dart';
import 'package:cdss_quiz/screens/screens.dart';
import 'package:get/get.dart';

import '../screens/home/learning_screen.dart';

class AppRoutes {
  static List<GetPage> pages() => [
        GetPage(
            name: ChallengeScreen.routeName,
            page: () => const ChallengeScreen(),
            binding: BindingsBuilder(() {
              // Get.put(MyDrawerController());
              Get.put(QuizPaperController());
            })),
        GetPage(
          name: LearningScreen.routeName,
          page: () => const LearningScreen(),
        ),
        // binding: BindingsBuilder(() {
        //   // Get.put(MyDrawerController());
        //   Get.put(QuizPaperController());
        // })),
        GetPage(
          name: SplashScreen.routeName,
          page: () => const SplashScreen(),
        ),
        GetPage(
            page: () => const ProfileScreen(),
            name: ProfileScreen.routeName,
            binding: BindingsBuilder(() {
              Get.put(QuizPaperController());
              Get.put(ProfileController());
            })),
        // GetPage(
        //   name: IntroScreen.routeName,
        //   page: () => IntroScreen(),
        // ),
        GetPage(
            name: HomeScreen.routeName,
            page: () => const HomeScreen(),
            binding: BindingsBuilder(() {
              Get.put(MyDrawerController());
              Get.put(QuizPaperController());
            })),
        GetPage(
          name: CustomDrawer.routeName,
          page: () => const CustomDrawer(),
        ),
        GetPage(name: LoginScreen.routeName, page: () => const LoginScreen()),
        GetPage(
            page: () => const QuizeScreen(),
            name: QuizeScreen.routeName,
            binding: BindingsBuilder(() {
              Get.put<QuizController>(QuizController());
            })),
        GetPage(
            page: () => const AnswersCheckScreen(),
            name: AnswersCheckScreen.routeName),
        GetPage(
            page: () => const QuizOverviewScreen(),
            name: QuizOverviewScreen.routeName),
        GetPage(
          page: () => const Resultcreen(),
          name: Resultcreen.routeName,
          //binding: Get.put<QuizController>(QuizController());
        ),
        GetPage(
            page: () => LeaderBoardScreen(),
            name: LeaderBoardScreen.routeName,
            binding: BindingsBuilder(() {
              Get.put(LeaderBoardController());
            })),
        GetPage(
            page: () => const OnBoardingScreen(),
            name: OnBoardingScreen.routeName,
            binding: BindingsBuilder(() {
              Get.put<OnBoardingController>(OnBoardingController());
            }))
      ];
}
