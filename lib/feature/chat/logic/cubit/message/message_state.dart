part of 'message_cubit.dart';

sealed class MessageState extends Equatable {
  const MessageState();

  @override
  List<Object> get props => [];
}

final class MessageInitial extends MessageState {}

final class SendMessageLoading extends MessageState {}

final class SendMessageFailed extends MessageState {}

final class SendMessageDone extends MessageState {}

final class UpdateMessageLoading extends MessageState {}

final class UpdateMessageFailed extends MessageState {}

final class UpdateMessageDone extends MessageState {}

final class DeleteMessageLoading extends MessageState {}

final class DeleteMessageFailed extends MessageState {}

final class DeleteMessageDone extends MessageState {}
