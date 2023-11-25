// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ChatFecthParams {
  final int nbre;
  final bool isOrderBydate;
  final String id;
  final DocumentSnapshot? lastMessage;

  const ChatFecthParams({
    required this.nbre,
    required this.isOrderBydate,
    required this.id,
    this.lastMessage,
  });

  ChatFecthParams copyWith({
    int? nbre,
    bool? isOrderBydate,
    String? id,
    DocumentSnapshot? lastMessage,
  }) {
    return ChatFecthParams(
      nbre: nbre ?? this.nbre,
      isOrderBydate: isOrderBydate ?? this.isOrderBydate,
      id: id ?? this.id,
      lastMessage: lastMessage ?? this.lastMessage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nbre': nbre,
      'isOrderBydate': isOrderBydate,
      'id': id,
    };
  }

  factory ChatFecthParams.fromMap(Map<String, dynamic> map) {
    return ChatFecthParams(
      nbre: map['nbre'] as int,
      isOrderBydate: map['isOrderBydate'] as bool,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatFecthParams.fromJson(String source) =>
      ChatFecthParams.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ChatFecthParams(nbre: $nbre, isOrderBydate: $isOrderBydate, id: $id, lastMessage: $lastMessage)';
  }

  @override
  bool operator ==(covariant ChatFecthParams other) {
    if (identical(this, other)) return true;

    return other.nbre == nbre &&
        other.isOrderBydate == isOrderBydate &&
        other.id == id &&
        other.lastMessage == lastMessage;
  }

  @override
  int get hashCode {
    return nbre.hashCode ^
        isOrderBydate.hashCode ^
        id.hashCode ^
        lastMessage.hashCode;
  }
}
