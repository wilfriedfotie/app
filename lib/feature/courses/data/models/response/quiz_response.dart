// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class QuizResponse {
  final String title;
  final String correctAnswer;
  final List<String> proposition;

  const QuizResponse({
    required this.title,
    required this.correctAnswer,
    required this.proposition,
  });

  QuizResponse copyWith({
    String? title,
    String? correctAnswer,
    List<String>? proposition,
  }) {
    return QuizResponse(
      title: title ?? this.title,
      correctAnswer: correctAnswer ?? this.correctAnswer,
      proposition: proposition ?? this.proposition,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'correctAnswer': correctAnswer,
      'proposition': proposition,
    };
  }

  factory QuizResponse.fromMap(Map<String, dynamic> map) {
    return QuizResponse(
      title: map['title'] as String,
      correctAnswer: map['correctAnswer'] as String,
      proposition: List<String>.from((map['proposition'] as List<String>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizResponse.fromJson(String source) =>
      QuizResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'QuizResponse(title: $title, correctAnswer: $correctAnswer, proposition: $proposition)';

  @override
  bool operator ==(covariant QuizResponse other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.correctAnswer == correctAnswer &&
        listEquals(other.proposition, proposition);
  }

  @override
  int get hashCode =>
      title.hashCode ^ correctAnswer.hashCode ^ proposition.hashCode;
}
