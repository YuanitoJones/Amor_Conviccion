import 'package:amor_conviccion/services/UpdateInfo.dart';
import 'package:amor_conviccion/services/storage_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

bool loading = true;

class Upload extends StatefulWidget{
  const Upload({Key? key}) : super(key: key);

  @override
  _Upload createState() => _Upload();
}

class _Upload extends State<Upload>{
  ChangePicture changePicture = ChangePicture();
  final _user = FirebaseAuth.instance.currentUser!;
  Storage storage = Storage();
  @override
  Widget build(BuildContext context) {
    return loading? TextButton(
      onPressed: () async {
        final result = await FilePicker.platform.pickFiles(
          allowMultiple: false,
          type: FileType.any,
        );
        if(result == null){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('No file selected',
              style: TextStyle(
                fontSize: 50
              ),),
            ),
          );
          return;
        }
        setState(() {
          loading = !loading;
        });
        final path = result.files.single.path;
        await storage.uploadFile(path!, 'Profile/'+_user.uid);
        await changePicture.changeProfilePicture();
        setState(() {
          loading = !loading;
        });
      },
      child: (
          const Text('Cambiar foto de perfil',
          style: TextStyle(fontSize: 15),)),
    ) : Center(child: CircularProgressIndicator(),);
  }
}