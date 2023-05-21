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
    final Color _textColor = UIParameters.isDarkMode(context)
        ? Colors.white
        : Theme.of(context).primaryColor;

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
                title: controller.correctAnsweredQuestions,
              ),
              Expanded(
                child: ContentArea(
                    color: customContentQuizColor(context),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //SvgPicture.asset('assets/images/bulb.svg'),
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
                          style: TextStyle(color: _textColor),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Text(
                          'Tap below question numbers to view correct answers',
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
                                  final _question =
                                      controller.allQuestions[index];

                                  AnswerStatus _status =
                                      AnswerStatus.notanswered;

                                  final _selectedAnswer =
                                      _question.selectedAnswer;
                                  final _correctAnswer =
                                      _question.correctAnswer;

                                  if (_selectedAnswer == _correctAnswer) {
                                    _status = AnswerStatus.correct;
                                  } else if (_question.selectedAnswer == null) {
                                    _status = AnswerStatus.wrong;
                                  } else {
                                    _status = AnswerStatus.wrong;
                                  }

                                  return QuizNumberCard(
                                    index: index + 1,
                                    status: _status,
                                    onTap: () {
                                      controller.jumpToQuestion(index,
                                          isGoBack: false);
                                      Get.toNamed(AnswersCheckScreen.routeName);
                                    },
                                  );
                                })),
                        Padding(
                            padding: EdgeInsets.symmetric(vertical: 40),
                            child: Row(
                              children: [
                                Expanded(
                                    child: MainButton(
                                  color: customContentQuizColor(context),
                                  onTap: () {
                                    controller.tryAgain();
                                  },
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
                                ))
                              ],
                            )),
                      ],
                    )),
              ),
              // ColoredBox(
              //   color: kLighterPrimaryColor,
              //   child: Padding(
              //       padding: UIParameters.screenPadding,
              //       child: Row(
              //         children: [
              //           Expanded(
              //               child: MainButton(
              //             color: kSecondaryColor,
              //             onTap: () {
              //               controller.tryAgain();
              //             },
              //             title: 'Try Again',
              //           )),
              //           const SizedBox(
              //             width: 5,
              //           ),
              //           Expanded(
              //               child: MainButton(
              //             onTap: () {
              //               controller.saveQuizResults();
              //             },
              //             title: 'Go to home',
              //           ))
              //         ],
              //       )),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
