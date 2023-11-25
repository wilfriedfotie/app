import 'package:LASYLAB/core/datasource/firestore/base_repository.dart';
import 'package:LASYLAB/core/datasource/firestore/exception.dart';
import 'package:LASYLAB/core/datasource/model/firestore_response.dart';
import 'package:LASYLAB/feature/chat/data/response/user_response.dart';
import 'package:LASYLAB/feature/chat/provider/user_provider.dart';

class UserRepository extends BaseRepository {
  final UserProvider _userProvider;

  UserRepository({required UserProvider userProvider})
      : _userProvider = userProvider;

  Future<FirestoreResponse<UserResponse, CustomFirebaseException>>
      getUser() async {
    return runFirestoreRequest<UserResponse>(
      call: () async {
        final response = await _userProvider.getUser();

        return FirestoreResponse.success(UserResponse.fromMap(
            {...response.data() as Map<String, dynamic>, "id": response.id}));
      },
    );
  }
}
