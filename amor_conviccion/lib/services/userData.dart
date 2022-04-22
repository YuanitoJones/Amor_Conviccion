import 'package:firebase_auth/firebase_auth.dart';
<<<<<<< HEAD
=======
import 'package:flutter/services.dart';
>>>>>>> parent of 7802e83 (Email Firebase)

class UserData {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;

  //SIGN UP METHOD
  Future signUpEmail(String email, String password) async {
    try {
<<<<<<< HEAD
      UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
=======
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password
>>>>>>> parent of 7802e83 (Email Firebase)
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }else{
        print("el error es $e");
      }
    }
  }

  //SIGN IN METHOD
  Future signIn({required String email, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }


  //SIGN OUT METHOD
  Future<void>signOut() async {
    await _auth.signOut();
<<<<<<< HEAD
    FirebaseAuth.instance.signOut();
=======
>>>>>>> parent of 7802e83 (Email Firebase)
  }
}

