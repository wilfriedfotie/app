import 'package:LASYLAB/feature/chat/provider/chat_provider.dart';
import 'package:LASYLAB/feature/chat/provider/user_provider.dart';
import 'package:LASYLAB/feature/chat/repository/chat_repository.dart';
import 'package:LASYLAB/feature/chat/repository/user_repository.dart';
import 'package:LASYLAB/feature/chat/service/audio_recording_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/dio.dart';

final sl = GetIt.instance;

Future<void> initDi() async {
  //core
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  final storage = FlutterSecureStorage();
  final _chatProvider =
      ChatProvider(ref: FirebaseFirestore.instance.collection("Chats"));
  final _userProvider =
      UserProvider(ref: FirebaseFirestore.instance.collection("Users"));

  sl.registerLazySingleton(() => storage);
  sl.registerLazySingleton(() => DioWrapper.getInstance());
  sl.registerLazySingleton<ChatProvider>(() => _chatProvider);
  sl.registerLazySingleton<ChatRepository>(
      () => ChatRepository(chatProvider: _chatProvider));
  sl.registerLazySingleton<UserRepository>(
      () => UserRepository(userProvider: _userProvider));
  sl.registerLazySingleton(() => AudioRecordingService());
}
