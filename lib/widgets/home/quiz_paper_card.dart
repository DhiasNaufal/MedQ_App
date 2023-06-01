import 'package:cdss_quiz/configs/configs.dart';
import 'package:cdss_quiz/controllers/controllers.dart';
import 'package:cdss_quiz/screens/screens.dart';
import 'package:cdss_quiz/widgets/widgets.dart';
import 'package:easy_separator/easy_separator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/models.dart';

class QuizPaperCard extends GetView<QuizPaperController> {
  const QuizPaperCard({
    Key? key,
    required this.model,
  }) : super(key: key);

  final QuizPaperModel model;

  @override
  Widget build(BuildContext context) {
    //const double padding = 10.0;
    return Ink(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 2.5,
              offset: const Offset(1, 2))
        ],
        borderRadius:
            BorderRadius.circular(25), //UIParameters.cardBorderRadius,
        color: Theme.of(context).cardColor,
      ),
      child: InkWell(
        borderRadius: UIParameters.cardBorderRadius,
        onTap: () {
          controller.navigatoQuestions(paper: model);
        },
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // ClipRRect(
                    //   borderRadius: UIParameters.cardBorderRadius,
                    //   child: ColoredBox(
                    //       color:
                    //           Theme.of(context).primaryColor.withOpacity(0.1),
                    //       child: SizedBox(
                    //         width: 65,
                    //         height: 65,
                    //         child: model.imageUrl == null ||
                    //                 model.imageUrl!.isEmpty
                    //             ? null
                    //             : Image.network(model.imageUrl!),
                    //       )),
                    // ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(
                          right: 100, left: 10, top: 8, bottom: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            model.title,
                            style: cardTitleTs(context),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          // SingleChildScrollView(
                          //   child: Padding(
                          //     padding:
                          //         const EdgeInsets.only(top: 10, bottom: 15),
                          //     child: Text(
                          //       model.description,
                          //       //style: cardTitleTs(context),
                          //     ),
                          //   ),
                          // ),
                          const SizedBox(
                            height: 10,
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: EasySeparatedRow(
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(width: 15);
                              },
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color(0xFFFFB957)),
                                  child: IconWithText(
                                      icon: const Icon(Icons.library_books,
                                          color: Color(0xFF00201C)),
                                      text: Text(
                                        '${model.questionsCount} Soal ',
                                        style: const TextStyle(
                                            color: Color(0xFF00201C)),
                                      )),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color(0xFFFFB957)),
                                  child: IconWithText(
                                      icon: const Icon(
                                        Icons.timer,
                                        color: Color(0xFF00201C),
                                      ),
                                      text: Text(
                                        model.timeInMinits(),
                                        style: const TextStyle(
                                            color: Color(0xFF00201C)),
                                        // style: kDetailsTS.copyWith(
                                        //     color: Colors.blueGrey),
                                      )),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ))
                  ],
                ),
                Positioned(
                    bottom: -20.5,
                    right: -12,
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        // Get.find<NotificationService>().showQuizCompletedNotification(id: 1, title: 'Sampole', body: 'Sample', imageUrl: model.imageUrl, payload: json.encode(model.toJson())  );
                        Get.toNamed(LeaderBoardScreen.routeName,
                            arguments: model);
                      },
                      child: Ink(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 15),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(kCardBorderrRadius),
                                bottomRight:
                                    Radius.circular(kCardBorderrRadius)),
                            color: kOnSecondaryColort),
                        child: const Column(
                          children: [
                            Icon(
                              AppIcons.trophyoutline,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              "LeaderBoard",
                              style:
                                  TextStyle(fontSize: 9, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    )),
                Container(
                  width: 18,
                  height: 18,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: kOnSecondaryColort,
                  ),
                )
              ],
            )),
      ),
    );
  }
}
