import 'package:amor_conviccion/services/UpdateInfo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: updatepoints(10),
      ),
    );
  }
  
  Widget updatepoints(int points){
    UpdatePoints update = UpdatePoints();
    update.updatepoints(points);
    return Text('Felicidades! Has aprobado la lección!\n Sigue asi!');
  }
}