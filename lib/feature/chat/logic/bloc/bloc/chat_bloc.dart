import 'dart:async';

import 'package:LASYLAB/core/datasource/firestore/exception.dart';
import 'package:LASYLAB/feature/authentication/data/models/profil_item.dart';
import 'package:LASYLAB/feature/chat/data/request/chat_fetch_params.dart';
import 'package:LASYLAB/feature/chat/data/request/message_request.dart';
import 'package:LASYLAB/feature/chat/data/response/group_response.dart';
import 'package:LASYLAB/feature/chat/data/response/message_response.dart';
import 'package:LASYLAB/feature/chat/repository/chat_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatRepository _chatRepository;
  final limit = 10;
  int page = 1;

  ChatBloc({required ChatRepository chatRepository})
      : _chatRepository = chatRepository,
        super(ChatInitial()) {
    on<CreateOrFetchChat>((event, emit) async {
      if (state is ChatCreateOrFetchLoading) return;
      emit(ChatCreateOrFetchLoading());
      final res = await _chatRepository.createOrFecthChat(event.request);
      if (res.isSuccess) {
        return emit(ChatCreateOrFetchSuccess(
          data: res.data!,
        ));
      } else {
        return emit(ChatCreateOrFetchFailed(error: res.error!));
      }
    });

    on<FetchChatMessages>((event, emit) async {
      page = 1;
      final StreamData _streamData = StreamData();

      if (state is ChatCreateOrFetchSuccess) {
        final oldState = state as ChatCreateOrFetchSuccess;

        final res = await _chatRepository.getLastChatMessages(ChatFecthParams(
            nbre: limit, isOrderBydate: true, id: oldState.data.id!.id));

        if (res.isSuccess) {
          res.data!.data.listen(_streamData.input.add);
          emit(ChatFetchMessagesSuccess(
            chat: oldState.data,
            messages: _streamData.output,
            hasMore: true ? true : false,
            lastDocumentSnapshot: res.data!.lastDoc,
            errorOnFecthMore: false,
            isLoading: false,
          ));
        } else {
          print(res.error);
        }
      }
    });

    on<FetchMoreChatMessages>((event, emit) async {
      final StreamData _streamData = StreamData();

      if (state is ChatFetchMessagesSuccess) {
        final oldState = state as ChatFetchMessagesSuccess;
        if (oldState.isLoading) return;
        page += 1;
        emit(oldState.copyWith(isLoading: true, errorOnFecthMore: false));
        final res = await _chatRepository.getMoreChatMessages(ChatFecthParams(
            nbre: limit + limit,
            isOrderBydate: true,
            id: oldState.chat.id!.id,
            lastMessage: event.params.lastMessage));

        if (res.isSuccess) {
          res.data!.data.listen(_streamData.input.add);

          emit(ChatFetchMessagesSuccess(
              chat: oldState.chat,
              hasMore: false,
              lastDocumentSnapshot: state.lastDocumentSnapshot,
              errorOnFecthMore: false,
              isLoading: false,
              messages: _streamData.output));
        } else {
          print("error");
          page -= 1;
          emit(oldState.copyWith(
              hasMore: true, isLoading: false, errorOnFecthMore: true));
        }
      }
    });
  }

  Stream<List<MessageResponse>> mergeStreams(
      Stream<List<MessageResponse>> stream1,
      Stream<List<MessageResponse>> stream2) {
    return Rx.combineLatest2<List<MessageResponse>, List<MessageResponse>,
        List<MessageResponse>>(
      stream1,
      stream2,
      (list1, list2) {
        List<MessageResponse> combinedList = [];
        combinedList.addAll(list1);
        combinedList.addAll(list2);
        return combinedList;
      },
    );
  }

  @override
  Future<void> close() {
    return super.close();
  }
}

class StreamData {
  final StreamController<List<MessageResponse>> historiyController =
      StreamController<List<MessageResponse>>.broadcast();

  StreamSink<List<MessageResponse>> get input => historiyController.sink;

  Stream<List<MessageResponse>> get output => historiyController.stream;

  get dispose => historiyController.close();
}
