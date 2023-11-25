part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserFailed extends UserState {
  final CustomFirebaseException error;

  const UserFailed({required this.error});

  @override
  List<Object> get props => [error];
}

final class UserSuccess extends UserState {
  final UserResponse data;
  const UserSuccess({required this.data});
  @override
  List<Object> get props => [data];
}
