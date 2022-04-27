import 'package:amor_conviccion/services/database.dart';
import 'package:amor_conviccion/services/storage_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:amor_conviccion/services/storage_service.dart';

class EmailSignInProvider{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;

  //SIGN UP METHOD
  Future signUp({required String email, required String password, required String name}) async {
    try {
      UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final updateUser = FirebaseAuth.instance.currentUser;
      updateUser?.updateDisplayName(name);
      await DatabaseService(uid: user.uid).updateUserData(name, email, 0, 'https://www.woolha.com/media/2020/03/eevee.png');
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
  Future<void>signOut() async {
    await _auth.signOut();
    FirebaseAuth.instance.signOut();
  }
}