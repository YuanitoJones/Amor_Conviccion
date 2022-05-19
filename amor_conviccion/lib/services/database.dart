import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService{
  final String uid;
  final String email;
  DatabaseService({ required this.uid, required this.email });
  final CollectionReference puntuacion = FirebaseFirestore.instance.collection('puntuacion');
  final CollectionReference leccion = FirebaseFirestore.instance.collection('Lecciones1');

  Future updateUserData(String name, String email, int points, String url) async {
    await leccion.doc(email).set({
      'Drogodependencia' : {
        'cuestionario' : {
          'nombre' : 'cuestionario',
          'completado' : false,
          'puntos' : 10,
          'respuestas' : {
            '0':0,
            '1':0,
            '2':0,
            '3':0,
            '4':0,
            '5':0,
            '6':0,
            '7':0,
            '8':0,
          },
        },
        'video' :{
          'nombre': 'video',
          'completado' : false,
        }
      }
    });
    return await puntuacion.doc(uid).set({
      'nombre': name,
      'correo': email,
      'puntos': points,
      'imagen': url,
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