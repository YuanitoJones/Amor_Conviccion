import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;

  Avatar({Key? key, required this.photourl}) : super(key: key);
  final String photourl;
  Widget avatar(Size size) {
    return CircleAvatar(
      backgroundColor: Colors.yellow,
      child: ClipOval(
          child: Image.network(
        photourl,
        fit: BoxFit.fill,
        width: size.width * 0.38,
        height: size.height,
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return avatar(size);
  }
}
