import 'package:cdss_quiz/configs/configs.dart';
import 'package:cdss_quiz/screens/home/home_screen.dart';
import 'package:cdss_quiz/widgets/common/circle_button.dart';
import 'package:cdss_quiz/widgets/common/main_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:cdss_quiz/controllers/controllers.dart';

class OnBoardingScreen extends GetView<OnBoardingController> {
  static const String routeName = '/boarding';
  //final _controller = OnboardingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
                controller: controller.pageController,
                onPageChanged: controller.selectedPageIndex,
                itemCount: controller.onboardingPages.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: UIParameters.getHeight(context) * 0.2,
                        ),
                        SvgPicture.asset(
                            controller.onboardingPages[index].imageAsset),
                        SizedBox(height: 32),
                        Text(
                          controller.onboardingPages[index].title,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 32),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 64.0),
                          child: Text(
                            controller.onboardingPages[index].description,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            Padding(
              padding: EdgeInsets.only(
                  bottom: UIParameters.getHeight(context) * 0.3),
              // bottom: UIParameters.getHeight(context) * 0.2,
              // left: UIParameters.getWidth(context) * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      controller.onboardingPages.length,
                      (index) => Obx(() {
                        return Container(
                          margin: const EdgeInsets.all(2),
                          width: 7,
                          height: 8,
                          decoration: BoxDecoration(
                            color: controller.selectedPageIndex.value == index
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Obx(
                  () {
                    return controller.isLastPage
                        ? Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    UIParameters.getWidth(context) * 0.1,
                                vertical:
                                    UIParameters.getHeight(context) * 0.1),
                            child: Center(
                                child: MainButton(
                                    child: Center(
                                        child: Text(
                                      "Let's get thhis done! shall we?",
                                      style: TextStyle(
                                          color: customHomeBackgroundColor(
                                              context),
                                          fontWeight: FontWeight.bold),
                                    )),
                                    color: customContentHomeColor(context),
                                    onTap: (() => controller.forwardAction()))),
                          )
                        : Padding(
                            padding: EdgeInsets.only(
                                bottom: UIParameters.getHeight(context) * 0.08,
                                right: UIParameters.getWidth(context) * 0.1),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FloatingActionButton(
                                    backgroundColor:
                                        customContentHomeColor(context),
                                    onPressed: controller.forwardAction,
                                    child: Icon(Icons.arrow_forward_ios)),
                              ],
                            ),
                          );

                    // : FloatingActionButton(
                    //     backgroundColor: customContentHomeColor(context),
                    //     //elevation: ,
                    //     onPressed: controller.forwardAction,
                    //     child: Icon(Icons.arrow_forward_ios));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      // floatingActionButton: Obx(
      //   () {
      //     return controller.isLastPage
      //         ? FloatingActionButton.extended(
      //             backgroundColor: customContentHomeColor(context),
      //             onPressed: controller.forwardAction,
      //             label: Text(
      //               "Start",
      //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      //             ),
      //           )
      //         : FloatingActionButton(
      //             backgroundColor: customContentHomeColor(context),
      //             //elevation: ,
      //             onPressed: controller.forwardAction,
      //             child: Icon(Icons.arrow_forward_ios));
      //   },
      // ),
      //floatingActionButtonLocation: FloatingActionButtonLocation,
    );
  }
}
