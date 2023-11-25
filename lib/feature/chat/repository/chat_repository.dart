// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:LASYLAB/core/datasource/firestore/base_repository.dart';
import 'package:LASYLAB/core/datasource/firestore/exception.dart';
import 'package:LASYLAB/core/datasource/model/firestore_response.dart';
import 'package:LASYLAB/feature/chat/data/request/chat_fetch_params.dart';
import 'package:LASYLAB/feature/chat/data/request/message_request.dart';
import 'package:LASYLAB/feature/chat/data/response/group_response.dart';
import 'package:LASYLAB/feature/chat/data/response/message_response.dart';
import 'package:LASYLAB/feature/chat/provider/chat_provider.dart';

class PaginationResult {
  final Stream<List<MessageResponse>> data;
  final DocumentSnapshot? lastDoc;
  PaginationResult({
    required this.data,
    this.lastDoc,
  });
}

class ChatRepository extends BaseRepository {
  final ChatProvider _chatProvider;

  ChatRepository({required ChatProvider chatProvider})
      : _chatProvider = chatProvider;

  Future<FirestoreResponse<void, CustomFirebaseException>> sendMessage(
      MessageRequest request) async {
    return runFirestoreRequest<MessageRequest>(
      call: () async {
        await _chatProvider.sendMessage(request);
        return FirestoreResponse.success(null);
      },
    );
  }

  Future<FirestoreResponse<GroupResponse, CustomFirebaseException>>
      createOrFecthChat(GroupResponse request) async {
    return runFirestoreRequest<GroupResponse>(
      call: () async {
        final response = await _chatProvider.createOrFecthChat(request);

        return FirestoreResponse.success(GroupResponse.fromMap({
          ...(response.data() as Map<String, dynamic>),
          "id": _chatProvider.ref.doc(response.id),
        }));
      },
    );
  }

  Future<FirestoreResponse<PaginationResult, CustomFirebaseException>>
      getLastChatMessages(ChatFecthParams request) {
    return runFirestoreRequest<PaginationResult>(
      call: () async {
        final response = _chatProvider.getLastChatMessages(request);

        DocumentSnapshot? result =
            await _chatProvider.getLastDocumentSnapshot(request);
        return FirestoreResponse.success(PaginationResult(
            data: response.map((event) => event.docs
                .map((e) => MessageResponse.fromMap({...e.data(), "id": e.id}))
                .toList()),
            lastDoc: result));
      },
    );
  }

  Future<FirestoreResponse<PaginationResult, CustomFirebaseException>>
      getMoreChatMessages(ChatFecthParams request) async {
    return runFirestoreRequest<PaginationResult>(
      call: () async {
        final response = _chatProvider.getMoreChatMessages(request);
        DocumentSnapshot? result =
            await _chatProvider.getLastDocumentSnapshot(request);
        return FirestoreResponse.success(PaginationResult(
            data: response.map((event) => event.docs
                .map((e) => MessageResponse.fromMap({
                      ...e.data(),
                      "id": e.id,
                    }))
                .toList()),
            lastDoc: result));
      },
    );
  }
}
