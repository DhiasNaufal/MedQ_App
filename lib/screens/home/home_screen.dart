import 'package:cdss_quiz/configs/configs.dart';
import 'package:cdss_quiz/controllers/controllers.dart';
import 'package:cdss_quiz/screens/home/custom_drawer.dart';
import 'package:cdss_quiz/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class HomeScreen extends GetView<MyDrawerController> {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    QuizPaperController quizePprContoller = Get.find();
    return Scaffold(
      body: GetBuilder<MyDrawerController>(
        builder: (_) => ZoomDrawer(
          controller: _.zoomDrawerController,
          borderRadius: 10.0,
          showShadow: true,
          angle: 0.0,
          menuScreen: const CustomDrawer(),
          style: DrawerStyle.DefaultStyle,
          slideWidth: MediaQuery.of(context).size.width * 0.55,
          mainScreen: Container(
            decoration: BoxDecoration(
                color: Theme.of(context)
                    .scaffoldBackgroundColor), //gradient: mainGradient(context)),
            child: SafeArea(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(kMobileScreenPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Transform.translate(
                            offset: const Offset(-10, 0),
                            child: CircularButton(
                              onTap: controller.toggleDrawer,
                              material: MaterialType.transparency,
                              child: Icon(
                                AppIcons.menuleft,
                                color: customOnHomeBackgroundColor(context),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: Row(
                              children: [
                                //const Icon(AppIcons.peace),
                                Builder(
                                  builder: (_) {
                                    final AuthController auth = Get.find();
                                    final user = auth.getUser();
                                    String label = 'Mate';
                                    if (user != null) {
                                      label = '${user.displayName}';
                                    }
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Hello,",
                                            style: kHomeHeader.copyWith(
                                                color:
                                                    customOnHomeBackgroundColor(
                                                        context))),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text(label,
                                            style: kHomeHeader.copyWith(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold))
                                      ],
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Center(
                    //   child: Text("Course",
                    //       style: kTitlePrimary.copyWith(
                    //           color: customContentHomeColor(context))),
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: ContentArea(
                          color: customContentHomeColor(context),
                          addPadding: false,
                          child: Obx(
                            () => LiquidPullToRefresh(
                              height: 150,
                              springAnimationDurationInMilliseconds: 500,
                              backgroundColor: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.1),
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.5),
                              onRefresh: () async {
                                quizePprContoller.getAllPapers();
                              },
                              child: ListView.separated(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 20),
                                shrinkWrap: true,
                                itemCount: quizePprContoller.allPapers.length,
                                itemBuilder: (BuildContext context, int index) {
                                  // if (index == 1) {
                                  //   return IgnorePointer(
                                  //     ignoring: true,
                                  //     child: QuizPaperCard(
                                  //       model:
                                  //           quizePprContoller.allPapers[index],
                                  //     ),
                                  //   );
                                  // }
                                  return QuizPaperCard(
                                    model: quizePprContoller.allPapers[index],
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const SizedBox(
                                    height: 20,
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
