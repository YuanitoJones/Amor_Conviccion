import 'package:amor_conviccion/services/storage_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Upload extends StatefulWidget{
  const Upload({Key? key}) : super(key: key);

  @override
  _Upload createState() => _Upload();
}

class _Upload extends State<Upload>{
  final _user = FirebaseAuth.instance.currentUser!;
  Storage storage = Storage();
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          final result = await FilePicker.platform.pickFiles(
            allowMultiple: false,
            type: FileType.any,
          );
          if(result == null){
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('No file selected'),
                ),
            );
            return;
          }
          final path = result.files.single.path;
          await storage.uploadFile(path!, 'Profile/'+_user.uid);
          await changePicture();
        },
        child: (
            const Text('Upload File')),
        );
  }

  Future changePicture() async{
    var ref = FirebaseStorage.instance.ref().child('Profile/'+_user.uid);
    String url = (await ref.getDownloadURL()).toString();
    var collection = FirebaseFirestore.instance.collection('puntuacion');
    collection.doc(_user.uid).update({'imagen': url})
    .then((value) => _user.updatePhotoURL(url))
    .catchError((error)=> print('Failed: $error'));

  }

}