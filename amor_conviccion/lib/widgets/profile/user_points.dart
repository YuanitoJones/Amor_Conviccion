import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserPoints extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;
  UserPoints({Key? key, required this.points}) : super(key: key);
  final int points;

  Widget userPoints(Size size) {
    return Text(
      (points.toString()),
      textAlign: TextAlign.center,
      style: const TextStyle(
          color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return userPoints(size);
  }
}
