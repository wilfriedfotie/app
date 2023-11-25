import 'package:LASYLAB/core/datasource/firestore/base_remote.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProvider extends BaseFirestoreController {
  UserProvider({required super.ref});

  String _testDocId = "yfQovA91KutHJzW0kHah";

  Future<DocumentSnapshot> getUser() async {
    try {
      DocumentSnapshot res = await ref.doc(_testDocId).get();
      return res;
    } catch (e) {
      rethrow;
    }
  }
}
