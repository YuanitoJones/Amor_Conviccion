import 'package:cloud_firestore/cloud_firestore.dart';

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

  //get stream
  Stream <QuerySnapshot> get users{
    return puntuacion.snapshots();
  }
}