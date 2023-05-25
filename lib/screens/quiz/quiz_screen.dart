import 'package:cdss_quiz/configs/configs.dart';
import 'package:cdss_quiz/controllers/controllers.dart';
import 'package:cdss_quiz/firebase/firebase_configs.dart';
import 'package:cdss_quiz/screens/screens.dart';
import 'package:cdss_quiz/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizeScreen extends GetView<QuizController> {
  const QuizeScreen({Key? key}) : super(key: key);

  static const String routeName = '/quizescreen';
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.onExitOfQuiz,
      child: Scaffold(

          //backgroundColor: customQuizBackgroundColor(context),
          extendBodyBehindAppBar: true,
          appBar: CustomAppBar(
            backColor: Colors.white,
            leading: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Obx(
                () => CountdownTimer(
                  time: controller.time.value,
                  color: cardColorDT,
                ),
              ),
              decoration: BoxDecoration(
                  color: kSecondaryColor,
                  borderRadius: BorderRadius.circular(5)),
            ),
            showActionIcon: true,
            titleWidget: Obx(() => Text(
                  'Q. ${(controller.questionIndex.value + 1).toString().padLeft(2, '0')}',
                  style: kAppBarTS,
                )),
          ),
          body: BackgroundDecoration(
            child: Obx(
              () => Column(
                children: [
                  if (controller.loadingStatus.value == LoadingStatus.loading)
                    Expanded(
                        child: ContentArea(
                            color: customContentQuizColor(context),
                            child: QuizScreenPlaceHolder())),
                  if (controller.loadingStatus.value == LoadingStatus.completed)
                    Expanded(
                      child: ContentArea(
                        color: customContentQuizColor(context),
                        child: Column(
                          children: [
                            Text(
                              controller.currentQuestion.value!.question,
                              style: kQuizeTS,
                              textAlign: TextAlign.center,
                            ),
                            Expanded(
                              child: GetBuilder<QuizController>(
                                  id: 'answers_list',
                                  builder: (context) {
                                    return ListView.separated(
                                      itemCount: controller.currentQuestion
                                          .value!.answers.length,
                                      shrinkWrap: true,
                                      padding: const EdgeInsets.only(top: 25),
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return const SizedBox(
                                          height: 10,
                                        );
                                      },
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final answer = controller
                                            .currentQuestion
                                            .value!
                                            .answers[index];
                                        return AnswerCard(
                                          isSelected: answer.identifier ==
                                              controller.currentQuestion.value!
                                                  .selectedAnswer,
                                          onTap: () {
                                            controller.selectAnswer(
                                                answer.identifier);
                                          },
                                          answer:
                                              '${answer.identifier}. ${answer.answer}',
                                        );
                                      },
                                    );
                                  }),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 40),
                              child: Row(
                                children: [
                                  Visibility(
                                    visible: controller.isFirstQuestion,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 5.0),
                                      child: SizedBox(
                                        height: 55,
                                        width: 55,
                                        child: MainButton(
                                          color: customPrimaryButton(context),
                                          onTap: () {
                                            controller.prevQuestion();
                                          },
                                          border:
                                              Theme.of(context).primaryColor,
                                          child: Icon(
                                            Icons.arrow_back_ios_new,
                                            color:
                                                customContentHomeColor(context),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Obx(
                                      () => Visibility(
                                        visible:
                                            controller.loadingStatus.value ==
                                                LoadingStatus.completed,
                                        child: MainButton(
                                          color: customPrimaryButton(context),
                                          onTap: () {
                                            controller.islastQuestion
                                                ? Get.toNamed(QuizOverviewScreen
                                                    .routeName)
                                                : controller.nextQuestion();
                                          },
                                          title: controller.islastQuestion
                                              ? 'Complete'
                                              : 'Next',
                                          border:
                                              Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  // ColoredBox(
                  //   color: kLighterPrimaryColor,
                  //   child: Padding(
                  //     padding: UIParameters.screenPadding,
                  //     child: Row(
                  //       children: [
                  //         Visibility(
                  //           visible: controller.isFirstQuestion,
                  //           child: Padding(
                  //             padding: const EdgeInsets.only(right: 5.0),
                  //             child: SizedBox(
                  //               height: 55,
                  //               width: 55,
                  //               child: MainButton(
                  //                 onTap: () {
                  //                   controller.prevQuestion();
                  //                 },
                  //                 child: const Icon(Icons.arrow_back_ios_new),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //         Expanded(
                  //           child: Obx(
                  //             () => Visibility(
                  //               visible: controller.loadingStatus.value ==
                  //                   LoadingStatus.completed,
                  //               child: MainButton(
                  //                 onTap: () {
                  //                   controller.islastQuestion
                  //                       ? Get.toNamed(
                  //                           QuizOverviewScreen.routeName)
                  //                       : controller.nextQuestion();
                  //                 },
                  //                 title: controller.islastQuestion
                  //                     ? 'Complete'
                  //                     : 'Next',
                  //               ),
                  //             ),
                  //           ),
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          )),
    );
  }
}
