import 'package:etimology/core/services/firebase_service.dart';
import 'package:etimology/core/utils/colors.dart';
import 'package:etimology/core/utils/size.dart';
import 'package:etimology/models/question_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../view_model/question/question_view_model.dart';
import '../../widgets/true_false_widget.dart';

class QuestionView extends StatefulWidget {
  const QuestionView({super.key});

  @override
  State<QuestionView> createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  QuestionViewModel viewModel = QuestionViewModel();

  @override
  void dispose() {
    viewModel.controller.close();
    viewModel.controller1.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Stream wordStream = viewModel.controller.stream.asBroadcastStream();
    Stream truefalseStream = viewModel.controller1.stream.asBroadcastStream();

    return Scaffold(
      appBar: AppBar(
        title: TextButton(
            onPressed: () {
              viewModel.shuffle();
              setState(() {});
            },
            child: const Text(
              "Yenile",
              style: TextStyle(color: Colors.white, fontSize: 24),
            )),
      ),
      body: StreamBuilder(
          initialData: UIColor.transparent, //initial data
          stream: truefalseStream, //Change background color true false Stream
          builder: (context, AsyncSnapshot snapshot) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(color: snapshot.data),
              height: DefaultResponsiveSizes(context).kDefaultHeight,
              width: DefaultResponsiveSizes(context).kDefaultWidth,
              child: StreamBuilder(
                stream: FirebaseHelper().challangeRef.snapshots(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  //if internet connection it too low or not available
                  if (snapshot.connectionState != ConnectionState.active) {
                    return const SizedBox();
                  }
                  if (snapshot.hasData) {
                    for (int index = 0;
                        index < snapshot.data.docs.length;
                        index++) {
                      viewModel.question = snapshot.data.docs[index].data();
                      QuestionModel questionModel =
                          viewModel.convert(viewModel.question);
                      viewModel.questionList.add(questionModel);
                    }
                    return StreamBuilder(
                        initialData: viewModel.shuffle(),
                        // Question Streams
                        stream: wordStream,
                        builder: (context, AsyncSnapshot snapshot) {
                          QuestionModel question = QuestionModel(
                              word: snapshot.data.word,
                              correct: snapshot.data.correct,
                              incorrect: snapshot.data.incorrect);
                          //we take 2 answer to list and make it shuffle
                          //if shuffled list's first index == correct make screen green :)
                          List<String> answers = [
                            question.correct,
                            question.incorrect,
                          ]..shuffle();
                          //else make screen red color
                          //We used streams but we can use setState instead of 2 stream :)
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: (Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                    height: DefaultResponsiveSizes(context)
                                            .kDefaultNormalHeight /
                                        4),
                                FutureBuilder(
                                    future: Future.delayed(
                                        const Duration(milliseconds: 500)),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        return Text(
                                          question.word.toUpperCase(),
                                          style: GoogleFonts.signikaNegative(
                                              textStyle: const TextStyle(
                                                  fontSize: 40)),
                                        );
                                      } else {
                                        return const SizedBox();
                                      }
                                    }),
                                getTrueFalseWidget(false, question, answers),
                                const SizedBox(height: 20),
                                getTrueFalseWidget(true, question, answers),
                                const SizedBox(height: 20),
                              ],
                            )),
                          );
                        });
                  } else {
                    return Container(
                      color: snapshot.data,
                    );
                  }
                },
              ),
            );
          }),
    );
  }

  Widget getTrueFalseWidget(
    bool r,
    QuestionModel questionModel,
    List<String> answers,
  ) {
    return TrueFalseWidget(
      answers: answers,
      question: questionModel,
      viewModel: viewModel,
      r: r,
    );
  }
}
