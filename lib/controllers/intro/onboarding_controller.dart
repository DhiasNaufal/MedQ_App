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
    OnboardingInfo('assets/images/logo_splash.svg', 'lalala', 'lalala'),
    OnboardingInfo('assets/images/logo_splash.svg', 'Cooking Safe Food',
        'We are maintain safty and We keep clean while making food.'),
    OnboardingInfo('assets/images/logo_splash.svg', 'Quick Delivery',
        'Orders your favorite meals will be  immediately deliver')
  ];
}
