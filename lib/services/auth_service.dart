import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get authStateChanges => _auth.idTokenChanges();
  User? get user => FirebaseAuth.instance.currentUser;

  //je passe les paramètre pour l'inscription pour le modéle

  Future<bool> signup(String email, String password) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (result.user != null) {
        //  await DBService().saveUser(Usermodel(id: result.user!.uid,no));
        return true;
      }

      return false;
    } catch (e) {
      return false;
    }
  }
}
