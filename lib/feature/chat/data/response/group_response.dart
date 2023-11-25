// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class GroupMembers {
  final DocumentReference id;
  final int unReadMessages;
  GroupMembers({
    required this.id,
    required this.unReadMessages,
  });

  GroupMembers copyWith({
    DocumentReference? id,
    int? unReadMessages,
  }) {
    return GroupMembers(
      id: id ?? this.id,
      unReadMessages: unReadMessages ?? this.unReadMessages,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'unReadMessages': unReadMessages,
    };
  }

  factory GroupMembers.fromMap(Map<String, dynamic> map) {
    return GroupMembers(
      id: map['id'],
      unReadMessages: map['unReadMessages'] as int,
    );
  }
}

class GroupResponse {
  final String groupIcon;
  final DocumentReference? id;
  final String groupName;
  final List<GroupMembers> members;
  final String lastSendMessage;
  final DateTime lastSendMessageTime;
  final DocumentReference initiator;
  final int totalMessages;
  GroupResponse({
    required this.groupIcon,
    this.id,
    required this.groupName,
    required this.members,
    required this.lastSendMessage,
    required this.lastSendMessageTime,
    required this.initiator,
    required this.totalMessages,
  });

  GroupResponse copyWith({
    String? groupIcon,
    DocumentReference? id,
    String? groupName,
    List<GroupMembers>? members,
    String? lastSendMessage,
    DateTime? lastSendMessageTime,
    DocumentReference? initiator,
    int? totalMessages,
  }) {
    return GroupResponse(
      groupIcon: groupIcon ?? this.groupIcon,
      id: id ?? this.id,
      groupName: groupName ?? this.groupName,
      members: members ?? this.members,
      lastSendMessage: lastSendMessage ?? this.lastSendMessage,
      lastSendMessageTime: lastSendMessageTime ?? this.lastSendMessageTime,
      initiator: initiator ?? this.initiator,
      totalMessages: totalMessages ?? this.totalMessages,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'groupIcon': groupIcon,
      'id': id,
      'groupName': groupName,
      'members': members.map((x) => x.toMap()).toList(),
      'lastSendMessage': lastSendMessage,
      'lastSendMessageTime': lastSendMessageTime.millisecondsSinceEpoch,
      'initiator': initiator,
      'totalMessages': totalMessages,
    };
  }

  factory GroupResponse.fromMap(Map<String, dynamic> map) {
    return GroupResponse(
      groupIcon: map['groupIcon'] as String,
      id: map['id'] != null ? map['id'] : null,
      groupName: map['groupName'] as String,
      members: List<GroupMembers>.from(
        (map['members'] as List).map<GroupMembers>(
          (x) => GroupMembers.fromMap(x as Map<String, dynamic>),
        ),
      ),
      lastSendMessage: map['lastSendMessage'] as String,
      lastSendMessageTime: DateTime.fromMillisecondsSinceEpoch(
          map['lastSendMessageTime'] as int),
      initiator: map['initiator'],
      totalMessages: map['totalMessages'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory GroupResponse.fromJson(String source) =>
      GroupResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GroupResponse(groupIcon: $groupIcon, id: $id, groupName: $groupName, members: $members, lastSendMessage: $lastSendMessage, lastSendMessageTime: $lastSendMessageTime, initiator: $initiator, totalMessages: $totalMessages)';
  }

  @override
  bool operator ==(covariant GroupResponse other) {
    if (identical(this, other)) return true;

    return other.groupIcon == groupIcon &&
        other.id == id &&
        other.groupName == groupName &&
        listEquals(other.members, members) &&
        other.lastSendMessage == lastSendMessage &&
        other.lastSendMessageTime == lastSendMessageTime &&
        other.initiator == initiator &&
        other.totalMessages == totalMessages;
  }

  @override
  int get hashCode {
    return groupIcon.hashCode ^
        id.hashCode ^
        groupName.hashCode ^
        members.hashCode ^
        lastSendMessage.hashCode ^
        lastSendMessageTime.hashCode ^
        initiator.hashCode ^
        totalMessages.hashCode;
  }
}
