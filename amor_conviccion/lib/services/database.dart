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
        'nombre': 'Drogodependencia',
        'cuestionario': {
          'nombre': 'cuestionario',
          'completado': false,
          'puntos': 10,
          'respuestas': {
            '1': '0',
            '2': '0',
            '3': '0',
            '4': '0',
            '5': '0',
            '6': '0',
            '7': '0',
            '8': '0',
            '9': '0',
          },
        },
        'video': {
          'puntos': 0,
          'nombre': 'video',
          'completado': false,
        },
        'lectura': {
          'puntos': 0,
          'nombre': 'lectura',
          'completado': false,
        }
      },
      'Liderazgo': {
        'nombre': 'Liderazgo',
        'cuestionario': {
          'completado': false,
          'puntos': 15,
          'nombre': 'cuestionario',
          'respuestas': {
            '1': '0',
            '2': '0',
            '3': '0',
          }
        },
        'cuestionario 2': {
          'completado': false,
          'puntos': 5,
          'nombre': 'cuestionario 2',
          'respuestas': {
            '1': '0',
            '2': '0',
            '3': '0',
            '4': '0',
            '5': '0',
            '6': '0',
          }
        },
        'lectura': {
          'puntos': 0,
          'nombre': 'lectura',
          'completado': false,
        },
        'video': {
          'puntos': 0,
          'nombre': 'video',
          'completado': false,
        },
      },
      'Intimidad': {
        'nombre': 'Intimidad',
        'mensaje': {
          'puntos': 0,
          'nombre': 'mensaje',
          'completado': false,
        },
        'cuestionario': {
          'nombre': 'cuestionario',
          'completado': false,
          'puntos': 5,
          'respuestas': {
            '1': '0',
            '2': '0',
            '3': '0',
            '4': '0',
            '5': '0',
          },
        },
        'cuestionario 2': {
          'nombre': 'cuestionario 2',
          'completado': false,
          'puntos': 1,
          'respuestas': {'1': '0', '2': '0'}
        }
      },
      'Anomia': {
        'nombre': 'Anomia',
        'cuestionario': {
          'nombre': 'cuestionario',
          'completado': false,
          'puntos': 10,
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

  Future updateProfile(String name, String email) async {
    final auth = FirebaseAuth.instance.currentUser!;
    auth.updateDisplayName(name);
    auth.updateEmail(email);
    return await FirebaseFirestore.instance
        .collection('puntuacion')
        .doc(auth.uid)
        .update({'nombre': name, 'correo': email});
  }

  //get stream
  Stream<QuerySnapshot> get users {
    return puntuacion.snapshots();
  }
}
