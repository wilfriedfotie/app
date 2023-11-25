// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'chat_bloc.dart';

sealed class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class CreateOrFetchChat extends ChatEvent {
  final GroupResponse request;

  const CreateOrFetchChat({
    required this.request,
  });

  @override
  List<Object> get props => [request];
}

class DeleteChat extends ChatEvent {}

class Test extends ChatEvent {}

class FetchChatMessages extends ChatEvent {}

class FetchMoreChatMessages extends ChatEvent {
  final ChatFecthParams params;

  const FetchMoreChatMessages({
    required this.params,
  });

  @override
  List<Object> get props => [params];
}
