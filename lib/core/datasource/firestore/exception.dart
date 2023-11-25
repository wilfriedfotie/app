import 'package:equatable/equatable.dart';

class CustomFirebaseException extends Equatable {
  final String code;
  final CustomFirebaseError errorType;
  final String details;

  const CustomFirebaseException({
    required this.code,
    required this.details,
    required this.errorType,
  });

  @override
  List<Object?> get props => [code, details, errorType];
}

enum CustomFirebaseError {
  parsing,
  http,
}
