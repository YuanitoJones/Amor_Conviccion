import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ChangePicture {
  Future changeProfilePicture() async {
    final _user = FirebaseAuth.instance.currentUser!;
    var ref = FirebaseStorage.instance.ref().child('Profile/' + _user.uid);
    String url = (await ref.getDownloadURL()).toString();
    var collection = FirebaseFirestore.instance.collection('puntuacion');
    collection
        .doc(_user.uid)
        .update({'imagen': url})
        .then((value) => _user.updatePhotoURL(url))
        .catchError((error) => print('Failed: $error'));
  }
}

class UpdatePoints {
  Future updatepoints(int points) async {
    final _user = FirebaseAuth.instance.currentUser!;
    var collection = FirebaseFirestore.instance.collection('puntuacion');
    FirebaseFirestore.instance
        .collection('puntuacion')
        .doc(_user.uid)
        .get()
        .then((DocumentSnapshot document) {
      collection
          .doc(_user.uid)
          .update({'puntos': document['puntos'] + points}).catchError(
              (error) => print('Failed: $error'));
    });
  }
}

class UpdateLesson {
  var user = FirebaseAuth.instance.currentUser;
  var collectionr = FirebaseFirestore.instance.collection('Lecciones1');

  Future updateVideoCompleted(String bloque, String lesson) async {
    collectionr.doc(user!.email).get().then((DocumentSnapshot doc) {
      collectionr
          .doc(user!.email)
          .update(({'$bloque.video.completado': true}))
          .catchError((error) => print('Failed: $error'));
    });
  }

  Future updateLectureCompleted(String bloque, String lesson) async {
    collectionr.doc(user!.email).get().then((DocumentSnapshot doc) {
      collectionr
          .doc(user!.email)
          .update(({'$bloque.lectura.completado': true}))
          .catchError((error) => print('Failed: $error'));
    });
  }

  Future updateLessonCompleted(int bloque, String lesson, List answers) async {
    switch (bloque) {
      case 1:
        collectionr.doc(user!.email).get().then((DocumentSnapshot doc) {
          collectionr
              .doc(user!.email)
              .update(({
                'Drogodependencia.${lesson}.completado': true,
                'Drogodependencia.${lesson}.respuestas.1': answers[0],
                'Drogodependencia.${lesson}.respuestas.2': answers[1],
                'Drogodependencia.${lesson}.respuestas.3': answers[2],
                'Drogodependencia.${lesson}.respuestas.4': answers[3],
                'Drogodependencia.${lesson}.respuestas.5': answers[4],
                'Drogodependencia.${lesson}.respuestas.6': answers[5],
                'Drogodependencia.${lesson}.respuestas.7': answers[6],
                'Drogodependencia.${lesson}.respuestas.8': answers[7],
                'Drogodependencia.${lesson}.respuestas.9': answers[8],
              }))
              .catchError((error) => print('Failed: $error'));
        });
        break;
      case 2:
        if (lesson == 'cuestionario') {
          collectionr.doc(user!.email).get().then((DocumentSnapshot doc) {
            collectionr
                .doc(user!.email)
                .update(({
                  'Liderazgo.${lesson}.completado': true,
                  'Liderazgo.${lesson}.respuestas.1': answers[0],
                  'Liderazgo.${lesson}.respuestas.2': answers[1],
                  'Liderazgo.${lesson}.respuestas.3': answers[2],
                }))
                .catchError((error) => print('Failed: $error'));
          });
        } else if (lesson == 'cuestionario 2') {
          collectionr.doc(user!.email).get().then((DocumentSnapshot doc) {
            collectionr
                .doc(user!.email)
                .update(({
                  'Liderazgo.${lesson}.completado': true,
                  'Liderazgo.${lesson}.respuestas.1': answers[0],
                  'Liderazgo.${lesson}.respuestas.2': answers[1],
                  'Liderazgo.${lesson}.respuestas.3': answers[2],
                  'Liderazgo.${lesson}.respuestas.4': answers[3],
                  'Liderazgo.${lesson}.respuestas.5': answers[4],
                  'Liderazgo.${lesson}.respuestas.6': answers[5],
                }))
                .catchError((error) => print('Failed: $error'));
          });
        }
        break;
    }

    var collection = FirebaseFirestore.instance.collection('Lecciones');
    FirebaseFirestore.instance
        .collection('Lecciones')
        .doc(lesson)
        .get()
        .then((DocumentSnapshot doc) {
      collection
          .doc(lesson)
          .update(({'Completado': true}))
          .catchError((error) => print('Failed: $error'));
    });
  }
}
