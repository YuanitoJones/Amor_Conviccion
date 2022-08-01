import 'package:amor_conviccion/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EmailSignInProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;

  //SIGN UP METHOD
  Future signUp(
      {required String email,
      required String password,
      required String name}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final updateUser = FirebaseAuth.instance.currentUser;
      updateUser?.updateDisplayName(name);
      await DatabaseService(uid: user.uid, email: email).updateUserData(
          name, email, 0, 'https://www.woolha.com/media/2020/03/eevee.png');
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //SIGN IN METHOD
  Future signIn({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //SIGN OUT METHOD
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    _auth.signOut();
  }
}
