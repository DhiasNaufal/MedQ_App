import 'package:cdss_quiz/configs/configs.dart';
import 'package:cdss_quiz/controllers/controllers.dart';
import 'package:cdss_quiz/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class ChallengeScreen extends GetView<MyDrawerController> {
  const ChallengeScreen({super.key});

  static const String routeName = '/challenge';

  @override
  Widget build(BuildContext context) {
    QuizPaperController quizePprContoller = Get.find();
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Container(
        decoration: BoxDecoration(
            color: Theme.of(context)
                .scaffoldBackgroundColor), //gradient: mainGradient(context)),
        child: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                      backgroundColor:
                          Theme.of(context).primaryColor.withOpacity(0.1),
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
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
                        separatorBuilder: (BuildContext context, int index) {
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
    );
  }
}
