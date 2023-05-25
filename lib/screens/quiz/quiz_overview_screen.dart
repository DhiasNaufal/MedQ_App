import 'package:cdss_quiz/configs/configs.dart';
import 'package:cdss_quiz/controllers/controllers.dart';
import 'package:cdss_quiz/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizOverviewScreen extends GetView<QuizController> {
  const QuizOverviewScreen({Key? key}) : super(key: key);

  static const String routeName = '/quizeoverview';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        backColor: Colors.white,
        title: controller.completedQuiz,
      ),
      body: BackgroundDecoration(
        child: Column(
          children: [
            Expanded(
              child: ContentArea(
                  color: customContentQuizColor(context),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CountdownTimer(
                            color: UIParameters.isDarkMode(context)
                                ? Theme.of(context).textTheme.bodyText1!.color
                                : Theme.of(context).primaryColor,
                            time: '',
                          ),
                          Obx(
                            () => Text(
                              '${controller.time} Remining',
                              style: countDownTimerTs(context),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                          child: GridView.builder(
                              itemCount: controller.allQuestions.length,
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount:
                                          UIParameters.getWidth(context) ~/ 75,
                                      childAspectRatio: 1,
                                      crossAxisSpacing: 8,
                                      mainAxisSpacing: 8),
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (_, index) {
                                AnswerStatus? _answerStatus;
                                if (controller
                                        .allQuestions[index].selectedAnswer !=
                                    null) {
                                  _answerStatus = AnswerStatus.answered;
                                }
                                return QuizNumberCard(
                                  index: index + 1,
                                  status: _answerStatus,
                                  onTap: () {
                                    controller.jumpToQuestion(index);
                                  },
                                );
                              })),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 40),
                        child: MainButton(
                          color: customContentHomeColor(context),
                          onTap: () {
                            controller.complete();
                          },
                          title: 'Complete',
                          border: customPrimaryButton(context),
                        ),
                      ),
                    ],
                  )),
            ),
            // ColoredBox(
            //   color: kLighterPrimaryColor,
            //   child: Padding(
            //     padding: UIParameters.screenPadding,
            //     child: MainButton(
            //       onTap: () {
            //         controller.complete();
            //       },
            //       title: 'Complete',
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
