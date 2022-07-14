import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ChangePicture {
  Future changeProfilePicture() async {
    final user = FirebaseAuth.instance.currentUser!;
    var ref = FirebaseStorage.instance.ref().child('Profile/' + user.uid);
    String url = (await ref.getDownloadURL()).toString();
    var collection = FirebaseFirestore.instance.collection('puntuacion');
    collection
        .doc(user.uid)
        .update({'imagen': url})
        .then((value) => user.updatePhotoURL(url))
        .catchError((error) => print('Failed: $error'));
  }
}

class UpdatePoints {
  Future updatepoints(int points) async {
    final user = FirebaseAuth.instance.currentUser!;
    var collection = FirebaseFirestore.instance.collection('puntuacion');
    FirebaseFirestore.instance
        .collection('puntuacion')
        .doc(user.uid)
        .get()
        .then((DocumentSnapshot document) {
      collection
          .doc(user.uid)
          .update({'puntos': document['puntos'] + points}).catchError(
              (error) => print('Failed: $error'));
    });
  }
}

class UpdateLesson {
  var user = FirebaseAuth.instance.currentUser;
  var collectionr = FirebaseFirestore.instance.collection('Lecciones1');

  Future updateCompleted(String bloque, String lesson) async {
    collectionr.doc(user!.email).get().then((DocumentSnapshot doc) {
      collectionr
          .doc(user!.email)
          .update(({'$bloque.$lesson.completado': true}))
          .catchError((error) => print('Failed: $error'));
    });
  }

  Future updateLessonCompleted(
      String nombloq, int bloque, String lesson, List answers) async {
    collectionr.doc(user!.email).get().then((DocumentSnapshot doc) {
      collectionr
          .doc(user!.email)
          .update(({
            '${nombloq}.${lesson}.completado': true,
            for (int i = 0; i < answers.length; i++)
              '$nombloq.$lesson.respuestas.${i + 1}': answers[i]
          }))
          .catchError((error) => print('Failed: $error'));
    });

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
