import 'package:cdss_quiz/configs/configs.dart';
import 'package:cdss_quiz/controllers/controllers.dart';
import 'package:cdss_quiz/firebase/firebase_configs.dart';
import 'package:cdss_quiz/models/models.dart';
import 'package:cdss_quiz/widgets/widgets.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_separator/easy_separator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

class LeaderBoardScreen extends GetView<LeaderBoardController> {
  LeaderBoardScreen({Key? key}) : super(key: key) {
    SchedulerBinding.instance.addPostFrameCallback((d) {
      final paper = Get.arguments as QuizPaperModel;
      controller.getAll(paper.id);
      controller.getMyScores(paper.id);
    });
  }

  static const String routeName = '/leaderboard';

  @override
  Widget build(BuildContext context) {
    const tsStyle =
        TextStyle(fontWeight: FontWeight.bold, color: kOnSecondaryColort);
    return Scaffold(
      //backgroundColor: kOnSecondaryColort,
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(
        backColor: Colors.white,
      ),
      bottomNavigationBar: Obx(() => controller.myScores.value == null
          ? const SizedBox()
          : LeaderBoardCard(
              textColor: UIParameters.isDarkMode(context)
                  ? Colors.white
                  : primaryColorLT,
              data: controller.myScores.value!,
              index: -1,
              style: TextStyle(
                  color: UIParameters.isDesktop(context)
                      ? Colors.white
                      : kOnSecondaryColort),
            )),
      body: Center(
        child: BackgroundDecoration(
          showGradient: true,
          child: Obx(
            () => controller.loadingStatus.value == LoadingStatus.loading
                ? ContentArea(
                    color: customContentQuizColor(context),
                    addPadding: true,
                    child: const LeaderBoardPlaceHolder(),
                  )
                : ContentArea(
                    color: customContentQuizColor(context),
                    addPadding: false,
                    child: ListView.separated(
                      itemCount: controller.leaderBoard.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider();
                      },
                      itemBuilder: (BuildContext context, int index) {
                        final data = controller.leaderBoard[index];
                        return LeaderBoardCard(
                          data: data,
                          index: index,
                          textColor: kOnSecondaryColort,
                          style: tsStyle,
                        );
                      },
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

class LeaderBoardCard extends StatelessWidget {
  const LeaderBoardCard({
    Key? key,
    required this.data,
    required this.index,
    required this.textColor,
    required this.style,
  }) : super(key: key);

  final LeaderBoardData data;
  final int index;
  final Color textColor;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //tileColor: Colors.black,
      // leading: CircleAvatar(
      //     //data.user.image == null ? null : NetworkImage(data.user.image!),
      //     ),
      title: Text(
        data.user.name,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
        ), //tsStyle
      ),
      subtitle: EasySeparatedRow(
        crossAxisAlignment: CrossAxisAlignment.center,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 12,
          );
        },
        children: [
          IconWithText(
            icon: Icon(
              Icons.done_all,
              color: Theme.of(context).primaryColor,
            ),
            text: Text(
              data.correctCount!,
              style: style,
            ),
          ),
          IconWithText(
            icon: Icon(
              Icons.timer,
              color: Theme.of(context).primaryColor,
            ),
            text: Text(
              '${data.time!}',
              style: style,
            ),
          ),
          IconWithText(
            icon: Icon(
              Icons.emoji_events_outlined,
              color: Theme.of(context).primaryColor,
            ),
            text: Text(
              '${data.points!}',
              style: style,
            ),
          ),
        ],
      ),
      trailing: Visibility(
        visible: index != -1,
        child: Text(
          '#${'${index + 1}'.padLeft(2, "0")}',
          style: style,
        ),
      ),
    );
  }
}
