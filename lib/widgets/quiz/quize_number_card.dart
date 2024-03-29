import 'package:cdss_quiz/configs/configs.dart';
import 'package:cdss_quiz/widgets/widgets.dart';
import 'package:flutter/material.dart';

class QuizNumberCard extends StatelessWidget {
  const QuizNumberCard({
    Key? key,
    required this.index,
    required this.status,
    required this.onTap,
  }) : super(key: key);

  final int index;
  final AnswerStatus? status;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Theme.of(context).primaryColor;

    switch (status) {
      case AnswerStatus.answered:
        backgroundColor = customPrimaryButton(context);
        break;
      case AnswerStatus.correct:
        backgroundColor = kCorrectAnswerColor;
        break;
      case AnswerStatus.wrong:
        backgroundColor = kWrongAnswerColor;
        break;
      case AnswerStatus.notanswered:
        backgroundColor = customPrimaryButton(context).withOpacity(0.1);
        break;
      default:
        backgroundColor = customPrimaryButton(context).withOpacity(0.1);
    }

    return InkWell(
      borderRadius: UIParameters.cardBorderRadius,
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: UIParameters.cardBorderRadius),
        child: Center(
          child: Text(
            '$index',
            style: kQuizeNumberCardTs.copyWith(
                color: status == AnswerStatus.notanswered
                    ? Theme.of(context).primaryColor
                    : null),
          ),
        ),
      ),
    );
  }
}
