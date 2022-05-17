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
  Future updateCompleted(String lesson) async{
    var collection = FirebaseFirestore.instance.collection('Lecciones');
    FirebaseFirestore.instance.collection('Lecciones').doc(lesson).get()
    .then((DocumentSnapshot doc){
      collection.doc(lesson).update(({'Completado' : true}))
      .catchError((error)=> print('Failed: $error'));
    });
  }
  
}