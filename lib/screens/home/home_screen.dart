import 'package:cdss_quiz/configs/configs.dart';
import 'package:cdss_quiz/controllers/controllers.dart';
import 'package:cdss_quiz/screens/home/custom_drawer.dart';
import 'package:cdss_quiz/screens/home/subject_screens.dart';
import 'package:cdss_quiz/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

import '../../models/models.dart';

class HomeScreen extends GetView<MyDrawerController> {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/home';
  //final UserModel? user_;

  @override
  Widget build(BuildContext context) {
    //QuizPaperController quizePprContoller = Get.find();
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
                                        Text("Hello",
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
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: ContentArea(
                        color: customContentHomeColor(context),
                        addPadding: false,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.builder(
                            itemCount: subjects.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 1,
                                    crossAxisSpacing: 2,
                                    mainAxisSpacing: 8),
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                  onTap: () {
                                    subjectStatus[index] != false
                                        ? Get.to(
                                            () => SubjectScreen(index: index))
                                        //subjectStatus[index+1] = true;
                                        : null;
                                    //index? 2 :1
                                  },
                                  child: subjectStatus[index] != false
                                      ? Card(
                                          child: Container(
                                            child: Column(children: [
                                              Image.asset(subjectImg[index]),
                                              Text(subjectName[index])
                                            ]),
                                          ),
                                        )
                                      : Card(
                                          child: Container(
                                            child: Column(children: [
                                              Icon(Icons.lock),
                                              Text("lol")
                                            ]),
                                          ),
                                        ));
                            },
                            //   padding: const EdgeInsets.symmetric(
                            //       horizontal: 10, vertical: 20),
                            //   shrinkWrap: true,
                            //   itemCount: quizePprContoller.allPapers.length,
                            //   itemBuilder: (BuildContext context, int index) {
                            //     // if (index == 1) {
                            //     //   return IgnorePointer(
                            //     //     ignoring: true,
                            //     //     child: QuizPaperCard(
                            //     //       model:
                            //     //           quizePprContoller.allPapers[index],
                            //     //     ),
                            //     //   );
                            //     // }
                            //     return QuizPaperCard(
                            //       model: quizePprContoller.allPapers[index],
                            //     );
                            //   },
                            //   separatorBuilder:
                            //       (BuildContext context, int index) {
                            //     return const SizedBox(
                            //       height: 20,
                            //     );
                            //   },
                            // ),
                          ),
                        ),
                      ),
                    ))
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
