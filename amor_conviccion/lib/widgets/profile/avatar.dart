import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget{
  final user = FirebaseAuth.instance.currentUser!;

  Avatar({Key? key, required this.photourl}) : super(key: key);
  final String photourl;
  Widget avatar(){
    return CircleAvatar(
      backgroundColor: Colors.yellow,
      child: ClipOval(
          child: Image.network(photourl, fit: BoxFit.fill, width: 140, height: 140,)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return avatar();
  }
}