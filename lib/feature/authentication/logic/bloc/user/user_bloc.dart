import 'package:LASYLAB/core/datasource/firestore/exception.dart';
import 'package:LASYLAB/feature/chat/data/response/user_response.dart';
import 'package:LASYLAB/feature/chat/repository/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;
  UserBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(UserInitial()) {
    on<FectUserData>((event, emit) async {
      if (state is UserLoading) return;
      emit(UserLoading());
      final res = await _userRepository.getUser();
      if (res.isSuccess) {
        emit(UserSuccess(data: res.data!));
      } else {
        emit(UserFailed(error: res.error!));
      }
    });
  }
}
