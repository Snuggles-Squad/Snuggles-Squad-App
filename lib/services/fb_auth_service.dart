import 'package:firebase_auth/firebase_auth.dart';
import 'package:snuggles_squad_app/model/user_model.dart';

class FbAuthService {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<UserDetails?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(userCredential.user?.email);

      //return _mapFirebaseUser(userCredential.user);
    } on FirebaseAuthException catch (e) {
      //throw _determineError(e);
      print(e);
    }
  }

  @override
  Future<UserDetails?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      print(user?.email);
      //return _mapFirebaseUser(_firebaseAuth.currentUser);
    } on FirebaseAuthException catch (e) {
      //throw _determineError(e);
      print(e);
    }
  }
}
