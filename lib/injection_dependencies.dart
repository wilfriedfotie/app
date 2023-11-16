import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/dio.dart';

final sl = GetIt.instance;

Future<void> initDi() async {
  //core
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  final storage = new FlutterSecureStorage();
  sl.registerLazySingleton(() => storage);
  sl.registerLazySingleton(() => DioWrapper.getInstance());
}
