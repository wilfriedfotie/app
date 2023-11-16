// To parse this JSON data, do
//
//     final reponse = reponseFromJson(jsonString);

import 'dart:convert';

Reponse reponseFromJson(String str) => Reponse.fromJson(json.decode(str));

String reponseToJson(Reponse data) => json.encode(data.toJson());

class Reponse {
  Reponse({
    this.id,
    this.etiquette,
    this.texte,
  });

  String? etiquette;
  String? texte;
  String? id;

  factory Reponse.fromJson(Map<String, dynamic> json) => Reponse(
        id: json["id"] == null ? null : json["id"],
        etiquette: json["etiquette"] == null ? null : json["etiquette"],
        texte: json["texte"] == null ? null : json["texte"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "etiquette": etiquette == null ? null : etiquette,
        "texte": texte == null ? null : texte,
      };
}
