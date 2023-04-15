import 'package:get/get.dart';

class QuizPaperModel {
  final String id;
  final String title;
  String? imageUrl;
  Rxn<String?>? url;
  final String description;
  final int timeSeconds;
  List<Question>? questions;
  final int questionsCount;

  QuizPaperModel({
    required this.id,
    required this.title,
    this.imageUrl,
    required this.description,
    required this.timeSeconds,
    required this.questions,
    required this.questionsCount,
  });
}

class Question {
  final String id;
  final String question;
  List<Answer> answers;
  final String? correctAnswer;
  String? selectedAnswer;

  Question({
    required this.id,
    required this.question,
    required this.answers,
    this.correctAnswer,
  });
}

class Answer {
  final String? identifier;
  final String? answer;

  Answer({
    this.identifier,
    this.answer,
  });
}
