import 'package:amor_conviccion/services/UpdateInfo.dart';
import 'package:amor_conviccion/services/storage_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

bool loading = true;

class Upload extends StatefulWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  _Upload createState() => _Upload();
}

class _Upload extends State<Upload> {
  ChangePicture changePicture = ChangePicture();
  final _user = FirebaseAuth.instance.currentUser!;
  Storage storage = Storage();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return loading
        ? TextButton(
            onPressed: () async {
              final result = await FilePicker.platform
                  .pickFiles(allowMultiple: false, type: FileType.image);
              if (result == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'No seleccionó ningun archivo',
                      style: TextStyle(
                          fontFamily: 'Comfortaa', fontSize: size.width * 0.04),
                    ),
                  ),
                );
                return;
              }
              setState(() {
                loading = !loading;
              });
              final path = result.files.single.path;
              await storage.uploadFile(path!, 'Profile/' + _user.uid);
              await changePicture.changeProfilePicture();
              setState(() {
                loading = !loading;
              });
            },
            child: (Text(
              'Cambiar foto de perfil',
              style:
                  TextStyle(fontSize: size.width * 0.045, color: Colors.white),
            )),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
