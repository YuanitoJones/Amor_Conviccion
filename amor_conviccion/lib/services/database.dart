import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final String uid;
  final String email;
  DatabaseService({required this.uid, required this.email});
  final CollectionReference puntuacion =
      FirebaseFirestore.instance.collection('puntuacion');
  final CollectionReference leccion =
      FirebaseFirestore.instance.collection('Lecciones1');
  Future updateUserData(
      String name, String email, int points, String url) async {
    await leccion.doc(email).set({
      'uid': uid,
      'Drogodependencia': {
        '1lectura': {
          'completado': false,
        },
        'cuestionario 1': {
          'completado': false,
          'puntos': 10,
        },
      },
      'Liderazgo': {
        '1lectura': {
          'completado': false,
        },
        'cuestionario 1': {
          'completado': false,
          'puntos': 15,
        },
        'cuestionario 2': {
          'completado': false,
          'puntos': 5,
        },
      },
      'Intimidad': {
        '1lectura': {
          'completado': false,
        },
        'mensaje': {
          'completado': false,
        },
        'cuestionario 1': {
          'completado': false,
          'puntos': 5,
        },
        'cuestionario 2': {
          'completado': false,
          'puntos': 1,
        }
      },
      'Anomia': {
        '1lectura': {'completado': false},
        'cuestionario 1': {
          'completado': false,
          'puntos': 10,
        },
        'cuestionario 2': {'completado': false, 'puntos': 5}
      },
      'Amor y Perdón': {
        '1lectura': {
          'completado': false,
        },
        'cuestionario 1': {'completado': false, 'puntos': 10},
        'cuestionario 2': {'completado': false, 'puntos': 5}
      }
    });
    return await puntuacion.doc(uid).set({
      'nombre': name,
      'correo': email,
      'puntos': points,
      'imagen': url,
      'nuevo':true
    });
  }

  Future updateProfile(String name, String email) async {
    final auth = FirebaseAuth.instance.currentUser!;
    auth.updateDisplayName(name);
    auth.updateEmail(email);
    return await FirebaseFirestore.instance
        .collection('puntuacion')
        .doc(auth.uid)
        .update({'nombre': name, 'correo': email});
  }

  Future updateNew() async{
    final auth = FirebaseAuth.instance.currentUser!;
    return await FirebaseFirestore.instance.collection('puntuacion').doc(auth.uid).update({'nuevo': false});
  }

  //get stream
  Stream<QuerySnapshot> get users {
    return puntuacion.snapshots();
  }
}
