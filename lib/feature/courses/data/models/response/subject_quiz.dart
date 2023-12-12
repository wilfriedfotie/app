// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:LASYLAB/feature/courses/data/models/response/quiz_response.dart';
import 'package:flutter/foundation.dart';

class SubjectQuiz {
  final String? video;
  final List<QuizResponse> quizs;
  SubjectQuiz({
    this.video,
    required this.quizs,
  });

  SubjectQuiz copyWith({
    String? video,
    List<QuizResponse>? quizs,
  }) {
    return SubjectQuiz(
      video: video ?? this.video,
      quizs: quizs ?? this.quizs,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'video': video,
      'quizs': quizs.map((x) => x.toMap()).toList(),
    };
  }

  factory SubjectQuiz.fromMap(Map<String, dynamic> map) {
    return SubjectQuiz(
      video: map['video'] != null ? map['video'] as String : null,
      quizs: List<QuizResponse>.from(
        (map['quizs'] as List).map<QuizResponse>(
          (x) => QuizResponse.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory SubjectQuiz.fromJson(String source) =>
      SubjectQuiz.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SubjectQuiz(video: $video, quizs: $quizs)';

  @override
  bool operator ==(covariant SubjectQuiz other) {
    if (identical(this, other)) return true;

    return other.video == video && listEquals(other.quizs, quizs);
  }

  @override
  int get hashCode => video.hashCode ^ quizs.hashCode;
}
