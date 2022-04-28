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
  final FirebaseAuth _auth = FirebaseAuth.instance;
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
          final filename = result.files.single.name;
          await storage.uploadFile(path!, _user.uid);
          changePicture();
        },
        child: (
            const Text('Upload File')),
        );
  }

  changePicture() async{
    var ref = FirebaseStorage.instance.ref().child(_user.uid);
    String url = (await ref.getDownloadURL()).toString();
    var collection = FirebaseFirestore.instance.collection('puntuacion');
    collection.doc(_user.uid).update({'imagen': url})
    .then((value) => print('Successful'))
    .catchError((error)=> print('Failed: $error'));
    _user.updatePhotoURL(url);
  }

}