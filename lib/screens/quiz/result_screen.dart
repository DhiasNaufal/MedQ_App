import 'package:cdss_quiz/configs/configs.dart';
import 'package:cdss_quiz/controllers/controllers.dart';
import 'package:cdss_quiz/screens/screens.dart';
import 'package:cdss_quiz/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Resultcreen extends GetView<QuizController> {
  const Resultcreen({Key? key}) : super(key: key);

  static const String routeName = '/resultscreen';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: BackgroundDecoration(
          child: Column(
            children: [
              CustomAppBar(
                leading: const SizedBox(
                  height: kToolbarHeight,
                ),
                titleWidget: Text(
                  (controller.correctAnsweredQuestions),
                  style: kAppBarTS.copyWith(color: Colors.white),
                ),
              ),
              Expanded(
                child: ContentArea(
                    color: customContentQuizColor(context),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/certification.svg',
                          height: UIParameters.getHeight(context) * 0.2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 5),
                          child: Text(
                            'Congratulations',
                            style: kHeaderTS.copyWith(
                                color: customQuizAction(context)),
                          ),
                        ),
                        Text(
                          'You have got ${controller.points} Points',
                          style: TextStyle(color: customQuizAction(context)),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          'Tap below question numbers to view correct answers',
                          style: detailsTS.copyWith(color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Expanded(
                            child: GridView.builder(
                                itemCount: controller.allQuestions.length,
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount:
                                            UIParameters.getWidth(context) ~/
                                                75,
                                        childAspectRatio: 1,
                                        crossAxisSpacing: 8,
                                        mainAxisSpacing: 8),
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (_, index) {
                                  final question =
                                      controller.allQuestions[index];

                                  AnswerStatus status =
                                      AnswerStatus.notanswered;

                                  final selectedAnswer =
                                      question.selectedAnswer;
                                  final correctAnswer = question.correctAnswer;

                                  if (selectedAnswer == correctAnswer) {
                                    status = AnswerStatus.correct;
                                  } else if (question.selectedAnswer == null) {
                                    status = AnswerStatus.wrong;
                                  } else {
                                    status = AnswerStatus.wrong;
                                  }

                                  return QuizNumberCard(
                                    index: index + 1,
                                    status: status,
                                    onTap: () {
                                      controller.jumpToQuestion(index,
                                          isGoBack: false);
                                      Get.toNamed(AnswersCheckScreen.routeName);
                                    },
                                  );
                                })),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 40),
                            child: Row(
                              children: [
                                Expanded(
                                    child: MainButton(
                                  color: customContentQuizColor(context),
                                  onTap: () {
                                    controller.tryAgain();
                                  },
                                  border: customPrimaryButton(context),
                                  child: Center(
                                    child: Text(
                                      "Coba lagi",
                                      style: TextStyle(
                                          color: customQuizAction(context)),
                                    ),
                                  ),
                                )),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                    child: MainButton(
                                  onTap: () {
                                    controller.saveQuizResults();
                                  },
                                  title: 'Go to home',
                                  border: customPrimaryButton(context),
                                ))
                              ],
                            )),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
