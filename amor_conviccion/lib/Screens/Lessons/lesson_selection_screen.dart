import 'package:amor_conviccion/widgets/lesson_select_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LessonSelectionScreen extends StatefulWidget {
  const LessonSelectionScreen(this.bloque, {Key? key}) : super(key: key);

  final bloque;
  final lessonNumber = 0;
  @override
  _LessonSelectionScreen createState() => _LessonSelectionScreen();
}

class _LessonSelectionScreen extends State<LessonSelectionScreen> {
  late int lessonNumber = widget.lessonNumber;
  final _user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Lecciones1')
            .where('uid', isEqualTo: _user!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Opps! Algo salio mal'),
            );
          } else {
            lessonNumber = 0;
            var document = snapshot.data!.docs[0];
            var info = lessonSelect(document);
            return Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(50),
                  child: Center(
                    child: Text(
                      info['nombre'].toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Createlessons(info, 'video'),
                        Createlessons(info, 'lectura'),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Divider(
                        thickness: 2,
                        indent: 15,
                        color: Color(0xFFC9C9C9),
                      ),
                    ),
                    AbsorbPointer(
                      absorbing: false,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Createlessons(info, 'cuestionario'),
                          Createlessons(info, 'cuestionario 2'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
        },
      ),
    ));
  }

  Widget Createlessons(var info, String leccion) {
    try {
      lessonNumber++;
      return Column(
        children: [
          LessonSelect(
              info[leccion]['puntos'],
              widget.bloque,
              info[leccion]['nombre'],
              info[leccion]['completado'],
              lessonNumber),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text(
              info[leccion]['nombre'].toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Comfortaa',
                fontSize: 20,
              ),
            ),
          ),
        ],
      );
    } catch (NoSuchMethodError) {
      return Container();
    }
  }

  lessonSelect(var document) {
    switch (widget.bloque) {
      case 1:
        return document['Drogodependencia'];
      case 2:
        return document['Liderazgo'];
    }
  }
}
