import 'dart:async';

import 'package:LASYLAB/core/datasource/firestore/base_remote.dart';
import 'package:LASYLAB/feature/chat/data/request/chat_fetch_params.dart';
import 'package:LASYLAB/feature/chat/data/request/message_request.dart';
import 'package:LASYLAB/feature/chat/data/response/group_response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatProvider extends BaseFirestoreController {
  ChatProvider({required super.ref});

  String _collectionName = "Messages";

  Future<DocumentReference<Map<String, dynamic>>> sendMessage(
      MessageRequest request) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      final res = await firestore
          .runTransaction<DocumentReference<Map<String, dynamic>>>(
              (transaction) async {
        final result = await ref
            .doc(request.chat!.id!.id)
            .collection(_collectionName)
            .add({...request.toMap(), "id": ref.doc(request.id)});

        final messages = await ref
            .doc(request.chat!.id!.id)
            .collection(_collectionName)
            .get();

        final nbreMessages = messages.size;

        transaction.update(request.chat!.id!, {
          'totalMessages': nbreMessages,
          "lastSendMessage": request.message,
          "lastSendMessageTime": DateTime.now().millisecondsSinceEpoch,
          "members": request.chat!.members.map((e) =>
              (e.id.id == request.sender!.id
                      ? GroupMembers(id: e.id, unReadMessages: nbreMessages)
                      : e)
                  .toMap())
        });

        return result;
      });

      return res;
    } catch (e) {
      rethrow;
    }
  }

  Future<DocumentSnapshot> createOrFecthChat(GroupResponse request) async {
    try {
      QuerySnapshot snapshot = await ref
          .where("groupName", isEqualTo: request.groupName)
          .limit(1)
          .get();

      if (snapshot.docs.isNotEmpty) {
        return snapshot.docs.first;
      }
      DocumentReference res = await ref.add(request.toMap());
      return await res.get();
    } catch (e) {
      rethrow;
    }
  }

  Future<DocumentSnapshot?> getLastDocumentSnapshot(
      ChatFecthParams request) async {
    try {
      final res = await ref
          .doc(request.id)
          .collection(_collectionName)
          .orderBy('createdAt', descending: request.isOrderBydate)
          .limit(request.nbre)
          .get();

      return res.docs.last;
    } catch (e) {
      rethrow;
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getLastChatMessages(
      ChatFecthParams request) async* {
    try {
      final stream = ref
          .doc(request.id)
          .collection(_collectionName)
          .orderBy('createdAt', descending: request.isOrderBydate)
          .limit(request.nbre)
          .snapshots()
          .asBroadcastStream();
      yield* stream;
    } catch (e) {
      rethrow;
    }
  }

  getLastChatMessagesTest(ChatFecthParams request) {
    try {
      return ref
          .doc(request.id)
          .collection(_collectionName)
          .orderBy('createdAt', descending: request.isOrderBydate)
          .limit(request.nbre)
          .snapshots();
    } catch (e) {
      rethrow;
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getMoreChatMessages(
      ChatFecthParams request) async* {
    try {
      yield* ref
          .doc(request.id)
          .collection(_collectionName)
          .orderBy('createdAt', descending: request.isOrderBydate)
          .startAfterDocument(request.lastMessage!)
          .limit(request.nbre)
          .snapshots();
    } catch (e) {
      rethrow;
    }
  }
}
