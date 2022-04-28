import 'package:amor_conviccion/widgets/UploadPhoto.dart';
import 'package:amor_conviccion/widgets/avatar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserInfoScreen extends StatelessWidget{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser!;
  UserInfoScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.blueGrey.shade900,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  <Widget>[
            const Text('Profile',
            style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 32,),
            Avatar(),
            Text('UID: ' + user.uid,
              style: const TextStyle(color: Colors.white, fontSize: 16),),
            const SizedBox(height: 8,),
            Text('Email: ' + user.email!,
              style: const TextStyle(color: Colors.white, fontSize: 16),),
            const Upload(),
          ],
        ),
      ),
    );
  }
}