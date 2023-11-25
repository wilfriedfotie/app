part of 'chat_bloc.dart';

sealed class ChatState extends Equatable {
  const ChatState({this.lastDocumentSnapshot});

  final DocumentSnapshot? lastDocumentSnapshot;

  @override
  List<Object> get props => [];
}

final class ChatInitial extends ChatState {}

final class ChatCreateOrFetchLoading extends ChatState {}

final class ChatCreateOrFetchSuccess extends ChatState {
  final GroupResponse data;

  const ChatCreateOrFetchSuccess(
      {required this.data, super.lastDocumentSnapshot});
  @override
  List<Object> get props => [data];
}

final class ChatFetchMessagesSuccess extends ChatState {
  final GroupResponse chat;
  final Stream<List<MessageResponse>> messages;
  final bool isLoading;
  final bool hasMore;
  final bool errorOnFecthMore;

  const ChatFetchMessagesSuccess(
      {required this.chat,
      required this.messages,
      required this.isLoading,
      required this.hasMore,
      required this.errorOnFecthMore,
      super.lastDocumentSnapshot});

  @override
  List<Object> get props => [chat, messages, hasMore, data, errorOnFecthMore];

  ChatFetchMessagesSuccess copyWith(
      {bool? isLoading,
      bool? hasMore,
      bool? errorOnFecthMore,
      GroupResponse? chat,
      Stream<List<MessageResponse>>? messages}) {
    return ChatFetchMessagesSuccess(
        isLoading: isLoading ?? this.isLoading,
        hasMore: hasMore ?? this.hasMore,
        errorOnFecthMore: errorOnFecthMore ?? this.errorOnFecthMore,
        messages: messages ?? this.messages,
        chat: chat ?? this.chat,
        lastDocumentSnapshot:
            lastDocumentSnapshot ?? this.lastDocumentSnapshot);
  }
}

final class ChatCreateOrFetchFailed extends ChatState {
  final CustomFirebaseException error;

  const ChatCreateOrFetchFailed({required this.error});

  @override
  List<Object> get props => [error];
}
