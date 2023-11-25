import 'dart:developer';

import 'package:LASYLAB/core/datasource/firestore/exception.dart';
import 'package:LASYLAB/core/datasource/model/firestore_response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BaseRepository {
  Future<FirestoreResponse<T, CustomFirebaseException>> runFirestoreRequest<T>(
      {required Future<FirestoreResponse<T, CustomFirebaseException>> Function()
          call}) async {
    try {
      final response = await call();
      return response;
    } on FirebaseException catch (e) {
      log(e.toString());
      return FirestoreResponse.error(CustomFirebaseException(
        code: e.code,
        details: e.message ?? "unkown exception",
        errorType: CustomFirebaseError.http,
      ));
    } catch (e) {
      log(e.toString());
      rethrow;
      return FirestoreResponse.error(CustomFirebaseException(
        code: CustomFirebaseError.parsing.name,
        errorType: CustomFirebaseError.parsing,
        details: e.toString(),
      ));
    }
  }
}
