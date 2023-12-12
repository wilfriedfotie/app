// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:LASYLAB/feature/chat/data/request/message_request.dart';

class MessageResponse {
  final String? id;
  final String? message;
  final String? image;
  final bool? isAnswer;
  final String? responseId;
  final String? sender;
  final DateTime? date;
  final MessageResponseType type;

  MessageResponse({
    this.id,
    this.message,
    this.image,
    this.isAnswer,
    this.sender,
    this.responseId,
    this.date,
    required this.type,
  });

  MessageResponse copyWith({
    String? id,
    String? message,
    String? image,
    String? sender,
    bool? isAnswer,
    String? responseId,
    DateTime? date,
    MessageResponseType? type,
  }) {
    return MessageResponse(
      id: id ?? this.id,
      message: message ?? this.message,
      sender: sender ?? this.sender,
      image: image ?? this.image,
      isAnswer: isAnswer ?? this.isAnswer,
      responseId: responseId ?? this.responseId,
      date: date ?? this.date,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'message': message,
      'sender': sender,
      'image': image,
      'isAnswer': isAnswer,
      'responseId': responseId,
      'createdAt': date?.millisecondsSinceEpoch,
      'type': type.name,
    };
  }

  factory MessageResponse.fromMap(Map<String, dynamic> map) {
    return MessageResponse(
      id: map['id'],
      message: map['message'] != null ? map['message'] as String : null,
      sender: map['sender'] != null ? map['sender'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      isAnswer: map['isAnswer'] != null ? map['isAnswer'] as bool : null,
      responseId:
          map['responseId'] != null ? map['responseId'] as String : null,
      date: map['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int)
          : null,
      type: MessageResponseType.values
          .firstWhere((element) => element.name == map['type']),
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageResponse.fromJson(String source) =>
      MessageResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MessageResponse(id: $id, message: $message, image: $image, isAnswer: $isAnswer, responseId: $responseId, date: $date, type: $type)';
  }

  @override
  bool operator ==(covariant MessageResponse other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.message == message &&
        other.image == image &&
        other.isAnswer == isAnswer &&
        other.responseId == responseId &&
        other.date == date &&
        other.type == type;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        message.hashCode ^
        image.hashCode ^
        isAnswer.hashCode ^
        responseId.hashCode ^
        date.hashCode ^
        type.hashCode;
  }
}
