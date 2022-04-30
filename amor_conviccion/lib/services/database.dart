import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService{
  final String uid;
  DatabaseService({ required this.uid });
  final CollectionReference puntuacion = FirebaseFirestore.instance.collection('puntuacion');

  Future updateUserData(String name, String email, int points, String url) async {
    return await puntuacion.doc(uid).set({
      'nombre': name,
      'correo': email,
      'puntos': points,
      'imagen': url
    });
  }

  Future updateProfile(String name, String email) async{
    final auth = FirebaseAuth.instance.currentUser!;
    auth.updateDisplayName(name);
    auth.updateEmail(email);
    return await FirebaseFirestore.instance.collection('puntuacion')
        .doc(auth.uid).update({'nombre': name, 'correo': email});
  }

  //get stream
  Stream <QuerySnapshot> get users{
    return puntuacion.snapshots();
  }
}