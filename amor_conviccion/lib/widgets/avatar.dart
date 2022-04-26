import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget{
  final user = FirebaseAuth.instance.currentUser!;
  Widget avatar(){
    bool flag = (user.photoURL) != null? true:false;
    return CircleAvatar(
      minRadius: 40,
      maxRadius: 60,
      backgroundColor: Colors.yellow,
      backgroundImage: (flag)? NetworkImage(user.photoURL!) : const NetworkImage('https://www.woolha.com/media/2020/03/eevee.png'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return avatar();
  }

}