import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserPoints extends StatelessWidget{
  final user = FirebaseAuth.instance.currentUser!;
  UserPoints({Key? key, required this.points}) : super(key: key);
  final int points;

  Widget userPoints(Size size){
    return Text((points.toString()),
      textAlign: TextAlign.center,
      style: const TextStyle(
          color: Colors.black54,
          fontSize: 25,
          fontWeight: FontWeight.bold),);
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return userPoints(size);
  }
}