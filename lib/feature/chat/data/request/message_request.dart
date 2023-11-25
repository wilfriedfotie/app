// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:LASYLAB/feature/chat/data/response/group_response.dart';
import 'package:LASYLAB/feature/chat/data/response/user_response.dart';

enum MessageResponseType { audio, photo, text, photoAndText }

class MessageRequest {
  final String? id;
  final String message;
  final String? image;
  final bool isAnswer;
  final String? responseId;
  final MessageResponseType type;
  final UserResponse? sender;
  final GroupResponse? chat;
  final DateTime? createdAt;

  const MessageRequest({
    this.id,
    required this.message,
    this.image,
    required this.isAnswer,
    this.responseId,
    required this.type,
    this.sender,
    this.chat,
    this.createdAt,
  });

  MessageRequest copyWith({
    String? id,
    String? message,
    String? image,
    bool? isAnswer,
    String? responseId,
    MessageResponseType? type,
    UserResponse? sender,
    GroupResponse? chat,
    DateTime? createdAt,
  }) {
    return MessageRequest(
      id: id ?? this.id,
      message: message ?? this.message,
      image: image ?? this.image,
      isAnswer: isAnswer ?? this.isAnswer,
      responseId: responseId ?? this.responseId,
      type: type ?? this.type,
      sender: sender ?? this.sender,
      chat: chat ?? this.chat,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'message': message,
      'image': image,
      'isAnswer': isAnswer,
      'responseId': responseId,
      'type': type.name,
      'sender': sender!.id,
      'readers': [sender!.id],
      'createdAt': createdAt?.millisecondsSinceEpoch,
    };
  }

  factory MessageRequest.fromMap(Map<String, dynamic> map) {
    return MessageRequest(
      id: map['id'] != null ? map['id'] as String : null,
      message: map['message'] as String,
      image: map['image'] != null ? map['image'] as String : null,
      isAnswer: map['isAnswer'] as bool,
      responseId:
          map['responseId'] != null ? map['responseId'] as String : null,
      type: MessageResponseType.values.firstWhere((elt) => elt == map['type']),
      createdAt: map['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageRequest.fromJson(String source) =>
      MessageRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MessageRequest(id: $id, message: $message, image: $image, isAnswer: $isAnswer, responseId: $responseId, type: $type, sender: $sender, chat: $chat, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant MessageRequest other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.message == message &&
        other.image == image &&
        other.isAnswer == isAnswer &&
        other.responseId == responseId &&
        other.type == type &&
        other.sender == sender &&
        other.chat == chat &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        message.hashCode ^
        image.hashCode ^
        isAnswer.hashCode ^
        responseId.hashCode ^
        type.hashCode ^
        sender.hashCode ^
        chat.hashCode ^
        createdAt.hashCode;
  }
}
