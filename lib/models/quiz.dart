// To parse this JSON data, do
//
//     final quiz = quizFromJson(jsonString);

import 'dart:convert';

import 'package:LASYLAB/models/question.dart';

Quiz quizFromJson(String str) => Quiz.fromJson(json.decode(str));

String quizToJson(Quiz data) => json.encode(data.toJson());

class Quiz {
  Quiz({
    this.idLecon,
    this.questions,
    this.id,
  });

  String? idLecon;
  List<Question>? questions;
  String? id;

  factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
        idLecon: json["id_lecon"] == null ? null : json["id_lecon"],
        questions: json["questions"] == null
            ? null
            : List<Question>.from(
                json["questions"].map((x) => Question.fromJson(x))),
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id_lecon": idLecon == null ? null : idLecon,
        "questions": questions == null
            ? null
            : List<dynamic>.from(questions!.map((x) => x.toJson())),
        "id": id == null ? null : id,
      };
}
