import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String totalScore;

  UserModel({
    required this.totalScore,
  });

  UserModel.fromSnapShot(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) : totalScore = snapshot['totalScore'] as String;
}
