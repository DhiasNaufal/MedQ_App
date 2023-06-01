import 'package:cdss_quiz/controllers/controllers.dart';
import 'package:cdss_quiz/firebase/firebase_configs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

extension QuizeResult on QuizController {
  int get correctQuestionCount => allQuestions
      .where((question) => question.selectedAnswer == question.correctAnswer)
      .toList()
      .length;

  String get correctAnsweredQuestions {
    return '$correctQuestionCount out of ${allQuestions.length} are correct';
  }

  String get points {
    var points = (remainSeconds / quizPaperModel.timeSeconds) *
        (correctQuestionCount * 100);
    return points.toStringAsFixed(2);
  }

  // String get totalPoints {
  //   var totalPoints = 5;
  //   return totalPoints.toString();
  // }

  Future<void> saveQuizResults() async {
    var batch = fi.batch();
    User? user = Get.find<AuthController>().getUser();
    if (user == null) return;
    batch.set(
        userFR
            .doc(user.email)
            .collection('myrecent_quizes')
            .doc(quizPaperModel.id),
        {
          "points": points,
          "correct_count": '$correctQuestionCount/${allQuestions.length}',
          "paper_id": quizPaperModel.id,
          "time": quizPaperModel.timeSeconds - remainSeconds,
          "status": true
        });
    batch.update(userFR.doc(user.email), {"totalScore": points});
    batch.set(
        leaderBoardFR
            .doc(quizPaperModel.id)
            .collection('scores')
            .doc(user.email),
        {
          "points": double.parse(points),
          "correct_count": '$correctQuestionCount/${allQuestions.length}',
          "paper_id": quizPaperModel.id,
          "user_id": user.email,
          "time": quizPaperModel.timeSeconds - remainSeconds
        });
    await batch.commit();
    navigateToHome();
    // Get.find<NotificationService>().showQuizCompletedNotification(
    //     id: 1,
    //     title: quizPaperModel.title,
    //     body:  'You have just got $points points for ${quizPaperModel.title} -  Tap here to view leaderboard' ,
    //     imageUrl: quizPaperModel.imageUrl,
    //     payload: json.encode(quizPaperModel.toJson()));
  }
}
