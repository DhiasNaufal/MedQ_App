import 'package:cdss_quiz/models/models.dart';
import 'package:cdss_quiz/screens/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;

  var pageController = PageController();

  forwardAction() {
    if (isLastPage) {
      Get.offAndToNamed(HomeScreen.routeName);
      //go to home page
    } else
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo('assets/images/hallo-ilustration.svg', 'Halo!',
        'Selamat Datang di Aplikasi Pembelajaran Clinical Decision Support System (CDSS)'),
    OnboardingInfo('assets/images/milestones.svg', 'Set Up Your Goals',
        'Tetapkan tujuanmu dan selesaikan semua kuis kuis yang tersedia'),
    OnboardingInfo('assets/images/winner.svg', 'Become A Winner',
        'Jadilah nomor 1 dan dapatkan keuntungan yang lebih!')
  ];
}
