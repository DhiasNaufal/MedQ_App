import 'package:cdss_quiz/controllers/controllers.dart';
import 'package:cdss_quiz/firebase/firebase_configs.dart';
import 'package:cdss_quiz/models/models.dart';
import 'package:cdss_quiz/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class LeaderBoardController extends GetxController {
  final leaderBoard = <LeaderBoardData>[].obs;
  final myScores = Rxn<LeaderBoardData>();
  final loadingStatus = LoadingStatus.completed.obs;

  void getAll(String paperId) async {
    loadingStatus.value = LoadingStatus.loading;
    try {
      final QuerySnapshot<Map<String, dynamic>> leaderBoardSnapShot =
          await getleaderBoard(paperId: paperId)
              .orderBy("points", descending: true)
              .limit(50)
              .get();
      final allData = leaderBoardSnapShot.docs
          .map((score) => LeaderBoardData.fromSnapShot(score))
          .toList();
      // //print(_leaderBoardSnapShot);
      for (var data in allData) {
        final userSnapshot = await userFR.doc(data.userId).get();
        print(userSnapshot);
        data.user = UserData.fromSnapShot(userSnapshot);

        //print(data.user.runtimeType);
      }

      leaderBoard.assignAll(allData);
      loadingStatus.value = LoadingStatus.completed;
    } catch (e) {
      loadingStatus.value = LoadingStatus.error;
      AppLogger.e(e);
    }
  }

  void getMyScores(String paperId) async {
    final user = Get.find<AuthController>().getUser();

    if (user == null) {
      return;
    }
    try {
      final DocumentSnapshot<Map<String, dynamic>> leaderBoardSnapShot =
          await getleaderBoard(paperId: paperId).doc(user.email).get();
      final myScores = LeaderBoardData.fromSnapShot(leaderBoardSnapShot);
      myScores.user = UserData(
        name: user.displayName!, /* image: user.photoURL*/
      );
      myScores.points = myScores as double?;
    } catch (e) {
      AppLogger.e(e);
    }
  }
}
