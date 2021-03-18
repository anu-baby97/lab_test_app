import 'package:firebase_auth/firebase_auth.dart';


class AuthService {
  final _firebaseAuth = FirebaseAuth.instance;

// GET UID
  Future<String> getCurrentUID() async {
    return (await _firebaseAuth.currentUser).uid;
  }
  //sign in
  Future<String> signInWithEmailAndPassword(String email,
      String password) async {
    return (await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password)).user.uid;
  }
}
