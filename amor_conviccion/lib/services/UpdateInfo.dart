import 'package:amor_conviccion/services/storage_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ChangePicture{
  Future changeProfilePicture() async{
    final _user = FirebaseAuth.instance.currentUser!;
    var ref = FirebaseStorage.instance.ref().child('Profile/'+_user.uid);
    String url = (await ref.getDownloadURL()).toString();
    var collection = FirebaseFirestore.instance.collection('puntuacion');
    collection.doc(_user.uid).update({'imagen': url})
        .then((value) => _user.updatePhotoURL(url))
        .catchError((error)=> print('Failed: $error'));
  }
}

class UpdatePoints{
  Future updatepoints(int points) async{
    final _user = FirebaseAuth.instance.currentUser!;
    var collection = FirebaseFirestore.instance.collection('puntuacion');
    FirebaseFirestore.instance.collection('puntuacion').doc(_user.uid).get().then((DocumentSnapshot document){
      collection.doc(_user.uid).update({'puntos': document['puntos'] + points})
          .catchError((error)=> print('Failed: $error'));
    });
  }
}

class UpdateLesson{

  Future updateVideoCompleted(int bloque, String lesson) async{
    var user = FirebaseAuth.instance.currentUser;
    var collectionr = FirebaseFirestore.instance.collection('Lecciones1');
    switch(bloque){
      case 1:
        collectionr.doc(user!.email).get().then((DocumentSnapshot doc){
          collectionr.doc(user.email).update(({
            'Drogodependencia.video.completado' : true
          }))
              .catchError((error)=> print('Failed: $error'));
        });
        break;
      case 2:
        collectionr.doc(user!.email).get().then((DocumentSnapshot doc){
          collectionr.doc(user.email).update(({
            'Liderazgo.video.completado' : true
          }))
              .catchError((error)=> print('Failed: $error'));
        });
        break;
    }


    /*var user = FirebaseAuth.instance.currentUser;
    var collection = FirebaseFirestore.instance.collection('Lecciones');
    FirebaseFirestore.instance.collection('Lecciones').doc(lesson).get()
        .then((DocumentSnapshot doc){
      collection.doc(lesson).update(({'Completado' : true}))
          .catchError((error)=> print('Failed: $error'));
    });*/
  }
  Future updateLessonCompleted(String lesson, List answers) async{
    var user = FirebaseAuth.instance.currentUser;
    var collectionr = FirebaseFirestore.instance.collection('Lecciones1');
    collectionr.doc(user!.email).get().then((DocumentSnapshot doc){
      collectionr.doc(user.email).update(({
        'Drogodependencia':{
          'cuestionario': {
            'completado' : true,
            'respuestas': {
              '1':answers[0],
              '2':answers[1],
              '3':answers[2],
              '4':answers[3],
              '5':answers[4],
              '6':answers[5],
              '7':answers[6],
              '8':answers[7],
              '9':answers[8],
            }
          }
        }
      }))
          .catchError((error)=> print('Failed: $error'));
    });


    var collection = FirebaseFirestore.instance.collection('Lecciones');
    FirebaseFirestore.instance.collection('Lecciones').doc(lesson).get()
    .then((DocumentSnapshot doc){
      collection.doc(lesson).update(({'Completado' : true}))
      .catchError((error)=> print('Failed: $error'));
    });
  }
  
}