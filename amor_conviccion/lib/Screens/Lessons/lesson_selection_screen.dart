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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: size.height * 0.2,
            decoration: const BoxDecoration(
              color: Color(0xFF42ADE2),
            ),
          ),
          SafeArea(
            child: StreamBuilder<QuerySnapshot>(
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
                        padding: EdgeInsets.all(size.width * 0.1),
                        child: Center(
                          child: Text(
                            info['nombre'].toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * 0.08,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.1,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Createlessons(size, info, 'video'),
                              Createlessons(size, info, 'lectura'),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                            child: Divider(
                              thickness: 2,
                              indent: 15,
                              color: Color(0xFFC9C9C9),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          AbsorbPointer(
                            absorbing: false,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Createlessons(size, info, 'cuestionario'),
                                Createlessons(size, info, 'cuestionario 2'),
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
          ),
        ],
      ),
    );
  }

  Widget Createlessons(Size size, var info, String leccion) {
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
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Comfortaa',
                fontSize: size.width * 0.05,
              ),
            ),
          ),
        ],
      );
    } on NoSuchMethodError {
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
