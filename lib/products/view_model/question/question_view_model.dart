import 'dart:async';

import 'package:etimology/models/question_model.dart';
import 'package:flutter/material.dart';

class QuestionViewModel {
  List<QuestionModel> questionList = [];

  shuffle() {
    return (questionList..shuffle()).first;
  }

  makeShuffle(List list) {
    return (list..shuffle());
  }

  dynamic question;

  StreamController controller = StreamController.broadcast();
  StreamController controller1 = StreamController.broadcast();
  QuestionModel convert(question) {
    return QuestionModel(
      word: question['kelime'],
      correct: question['correct'],
      incorrect: question['incorrect'],
    );
  }
}

class Size20 extends StatelessWidget {
  const Size20({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 20);
  }
}
