import 'package:cdss_quiz/configs/configs.dart';
import 'package:flutter/material.dart';

enum AnswerStatus { correct, wrong, answered, notanswered }

class AnswerCard extends StatelessWidget {
  const AnswerCard({
    Key? key,
    required this.answer,
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);

  final String answer;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: UIParameters.cardBorderRadius,
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: UIParameters.cardBorderRadius,
            color: isSelected ? customQuizAction(context) : Colors.white,
            border: Border.all(
                color: isSelected
                    ? customQuizAction(context)
                    : answerBorderColor(context))),
        child: Text(
          answer,
          style: TextStyle(
              color: isSelected ? kOnSurfaceTextColor : tertiaryColorDT),
        ),
      ),
    );
  }
}

class CorrectAnswerCard extends StatelessWidget {
  const CorrectAnswerCard({
    Key? key,
    required this.answer,
  }) : super(key: key);

  final String answer;

  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: UIParameters.cardBorderRadius,
        color: kCorrectAnswerColor.withOpacity(0.5),
      ),
      child: Text(
        answer,
        style: TextStyle(
            color: customQuizAction(context), fontWeight: FontWeight.bold),
      ),
    );
  }
}

class WrongAnswerCard extends StatelessWidget {
  const WrongAnswerCard({
    Key? key,
    required this.answer,
  }) : super(key: key);

  final String answer;

  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: UIParameters.cardBorderRadius,
        color: kWrongAnswerColor.withOpacity(0.5),
      ),
      child: Text(
        answer,
        style: const TextStyle(
            color: kWrongAnswerColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class NotAnswerCard extends StatelessWidget {
  const NotAnswerCard({
    Key? key,
    required this.answer,
  }) : super(key: key);

  final String answer;

  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: UIParameters.cardBorderRadius,
        color: kNotAnswerColor.withOpacity(0.1),
      ),
      child: Text(
        answer,
        style: const TextStyle(
            color: kNotAnswerColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
