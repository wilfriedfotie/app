// To parse this JSON data, do
//
//     final question = questionFromJson(jsonString);

import 'dart:convert';

import 'package:LASYLAB/models/reponse.dart';

Question questionFromJson(String str) => Question.fromJson(json.decode(str));

String questionToJson(Question data) => json.encode(data.toJson());

class Question {
  Question({
    this.id,
    this.texte,
    this.reponses,
    this.correct,
  });

  String? id;
  String? texte;
  List<Reponse>? reponses;
  Reponse? correct;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"] == null ? null : json["id"],
        texte: json["texte"] == null ? null : json["texte"],
        reponses: json["reponses"] == null
            ? null
            : List<Reponse>.from(
                json["reponses"].map((x) => Reponse.fromJson(x))),
        correct:
            json["correct"] == null ? null : Reponse.fromJson(json["correct"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "texte": texte == null ? null : texte,
        "reponses": reponses == null
            ? null
            : List<dynamic>.from(reponses!.map((x) => x.toJson())),
        "correct": correct == null ? null : correct!.toJson(),
      };
}
