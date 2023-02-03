// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class QuestionModel {
  final String word;
  final String correct;
  final String incorrect;
  QuestionModel({
    required this.word,
    required this.correct,
    required this.incorrect,
  });


  QuestionModel copyWith({
    String? word,
    String? correct,
    String? incorrect,
  }) {
    return QuestionModel(
      word: word ?? this.word,
      correct: correct ?? this.correct,
      incorrect: incorrect ?? this.incorrect,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'word': word,
      'correct': correct,
      'incorrect': incorrect,
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      word: map['word'] as String,
      correct: map['correct'] as String,
      incorrect: map['incorrect'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) => QuestionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'QuestionModel(word: $word, correct: $correct, incorrect: $incorrect)';

  @override
  bool operator ==(covariant QuestionModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.word == word &&
      other.correct == correct &&
      other.incorrect == incorrect;
  }

  @override
  int get hashCode => word.hashCode ^ correct.hashCode ^ incorrect.hashCode;
}
