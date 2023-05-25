import 'package:cdss_quiz/configs/configs.dart';
import 'package:cdss_quiz/widgets/common/main_button.dart';
import 'package:flutter/material.dart';
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
                        Container(
                          decoration: BoxDecoration(
                              color: customsvg(context),
                              borderRadius: BorderRadius.circular(10)),
                          child: SvgPicture.asset(
                            controller.onboardingPages[index].imageAsset,
                            height: UIParameters.getHeight(context) * 0.21,
                          ),
                        ),
                        SizedBox(height: 42),
                        Text(controller.onboardingPages[index].title,
                            style:
                                titleTS.copyWith(color: accentColor(context))),
                        SizedBox(height: 32),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 64.0),
                          child: Text(
                            controller.onboardingPages[index].description,
                            textAlign: TextAlign.center,
                            style: detailsTS,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            Padding(
              padding: EdgeInsets.only(
                  bottom: UIParameters.getHeight(context) * 0.2),
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
                            border: Border.all(color: accentColor(context)),
                            color: controller.selectedPageIndex.value == index
                                ? accentColor(context)
                                : Theme.of(context).scaffoldBackgroundColor,
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
                                "Let's get this done! shall we?",
                                style: TextStyle(
                                    color: customHomeBackgroundColor(context),
                                    fontWeight: FontWeight.bold),
                              )),
                              color: accentColor(context),
                              onTap: (() => controller.forwardAction()),
                              border: accentColor(context),
                            )),
                          )
                        : Padding(
                            padding: EdgeInsets.only(
                                bottom: UIParameters.getHeight(context) * 0.1,
                                right: UIParameters.getWidth(context) * 0.12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FloatingActionButton(
                                    elevation: 0,
                                    backgroundColor: accentColor(context),
                                    onPressed: controller.forwardAction,
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                    )),
                              ],
                            ),
                          );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSvgIllustration extends StatelessWidget {
  const CustomSvgIllustration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final assetName = brightness == Brightness.dark
        ? 'assets/svg_dark.svg'
        : 'assets/svg_light.svg';

    return SvgPicture.asset(
      assetName,
    );
  }
}
