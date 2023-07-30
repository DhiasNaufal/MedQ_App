import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../configs/configs.dart';
import '../../controllers/controllers.dart';
import '../../models/models.dart';
import '../../widgets/widgets.dart';
import 'subject_screens.dart';

class LearningScreen extends GetView<MyDrawerController> {
  const LearningScreen({super.key});
  static const String routeName = '/learn';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: Container(
          decoration: BoxDecoration(
              color: Theme.of(context)
                  .scaffoldBackgroundColor), //gradient: mainGradient(context)),
          child: SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Center(
                  child: Text(
                "What do you want to learn today?",
                style: kHeaderTS.copyWith(
                    color: Theme.of(context).primaryColor, fontSize: 20),
              )),
              SizedBox(
                height: 20,
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
                              navigatoSubject(index: index);
                              // Get.to(() => SubjectScreen(index: index));
                              // subjectStatus[index] != false
                              //     ? Get.to(
                              //         () => SubjectScreen(index: index))
                              //     //subjectStatus[index+1] = true;
                              //     : null;
                              //index? 2 :1
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                //set border radius more than 50% of height and width to make circle
                              ),
                              child: Container(
                                padding: EdgeInsets.all(2),
                                child: Column(children: [
                                  Image.asset(subjectImg[index]),
                                  Text(
                                    subjectName[index],
                                    textAlign: TextAlign.center,
                                  )
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
        ));
  }
}

void navigatoSubject(
    //Get.toNamed(QuizeScreen.routeName, arguments: paper);
    {bool isTryAgain = false,
    required int index}) {
  AuthController authController = Get.find();

  if (authController.isLogedIn()) {
    if (isTryAgain) {
      Get.back();
      Get.to(() => SubjectScreen(index: index));
    } else {
      Get.to(() => SubjectScreen(index: index));
    }
  } else {
    authController.showLoginAlertDialog();
  }
}
