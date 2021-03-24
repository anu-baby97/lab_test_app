import 'package:firebase_auth/firebase_auth.dart';


class AuthService {
  final _firebaseAuth = FirebaseAuth.instance;
  final _auth = FirebaseAuth.instance;



// GET UID OF PATIENT
  Future<String> getCurrentUID() async {
    return (await _firebaseAuth.currentUser).uid;
  }
  //GET UID OF LAB
  Future<String> getCurrentUIDofLab() async {
    return (await _auth.currentUser).uid;
  }
  //sign in
  Future<String> signInWithEmailAndPassword(String email,
      String password) async {
    return (await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password)).user.uid;
  }
}
