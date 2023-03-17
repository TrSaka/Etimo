import 'package:flutter/material.dart';
import '../../core/utils/colors.dart';
import '../../core/utils/size.dart';
import '../../models/question_model.dart';
import '../view_model/question/question_view_model.dart';

class TrueFalseWidget extends StatelessWidget {
  const TrueFalseWidget({
    Key? key,
    required this.answers,
    required this.question,
    required this.viewModel,
    required this.r,
  }) : super(key: key);

  final List<String> answers;
  final QuestionModel question;
  final QuestionViewModel viewModel;
  final bool r;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(milliseconds: 500)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Expanded(
            child: InkWell(
              onTap: () {
                if (r == false
                    ? answers[0] == question.correct
                    : answers[1] == question.correct) {
                  correct();
                } else {
                  wrong();
                }
              },
              child: Container(
                width: DefaultResponsiveSizes(context).kDefaultWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: UIColor.buttonColor,
                ),
                child: Center(
                    child: Text(
                  r == false
                      ? answers[0].toUpperCase()
                      : answers[1].toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                )),
              ),
            ),
          );
        } else {
          return StreamBuilder(
            stream: viewModel.controller1.stream,
            builder: (context, snapshot) {
              return Container(
                color: snapshot.data,
              );
            },
          );
        }
      },
    );
  }

  Future<dynamic> correct() {
    Future.delayed(const Duration(milliseconds: 100));
    viewModel.controller1.sink.add(Colors.green[300]);
    return Future.delayed(const Duration(milliseconds: 500), () {
      viewModel.controller1.sink.add(UIColor.backgroundColor);
    });
  }

  Future<dynamic> wrong() {
    Future.delayed(const Duration(milliseconds: 100));
    viewModel.controller1.sink.add(Colors.red[600]);
    return Future.delayed(const Duration(milliseconds: 500), () {
      viewModel.controller1.sink.add(UIColor.backgroundColor);
    });
  }
}
