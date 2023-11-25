import 'package:LASYLAB/feature/chat/data/request/message_request.dart';
import 'package:LASYLAB/feature/chat/repository/chat_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  ChatRepository _chatRepository;

  MessageCubit({required ChatRepository chatRepository})
      : _chatRepository = chatRepository,
        super(MessageInitial());

  void sendMessage(MessageRequest request) async {
    if (state is SendMessageLoading) return;
    emit(SendMessageLoading());
    final result = await _chatRepository.sendMessage(request);
    if (result.isSuccess) {
      emit(SendMessageDone());
    } else {
      emit(SendMessageFailed());
    }
  }
}
