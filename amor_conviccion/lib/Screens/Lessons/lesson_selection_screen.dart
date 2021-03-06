import 'package:amor_conviccion/widgets/lesson_select_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LessonSelectionScreen extends StatefulWidget {
  const LessonSelectionScreen(this.bloque, this.nombloq, {Key? key})
      : super(key: key);

  final String nombloq; //Nombre del bloque
  final int bloque; //Bloque de informacion
  final lessonNumber = 0; //Numeracion de lecciones

  @override
  State<LessonSelectionScreen> createState() => _LessonSelectionScreen();
}

class _LessonSelectionScreen extends State<LessonSelectionScreen> {
  late int lessonNumber = widget.lessonNumber;
  final _user = FirebaseAuth.instance.currentUser;

  List<String> lesson = [
    'video',
    'lectura',
    'cuestionario',
    'cuestionario 2',
    'mensaje',
  ];
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
                      SizedBox(
                        height: size.height * 0.7,
                        child: ListView.builder(
                            itemCount: 5,
                            itemBuilder: (builder, index) {
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      if (index % 2 == 0)
                                        createLessons(
                                            size, info, lesson[index]),
                                      if (index % 2 == 0 &&
                                          index + 1 != lesson.length)
                                        createLessons(
                                            size, info, lesson[index + 1]),
                                    ],
                                  ),
                                  if (index % 2 == 0)
                                    const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(15, 10, 15, 10),
                                      child: Divider(
                                        thickness: 2,
                                        indent: 15,
                                        color: Color(0xFFC9C9C9),
                                      ),
                                    ),
                                ],
                              );
                            }),
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

  Widget createLessons(Size size, var info, String leccion) {
    try {
      lessonNumber++;
      return Column(
        children: [
          LessonSelect(
              info[leccion]['puntos'],
              widget.nombloq,
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
      lessonNumber--;
      return Container();
    }
  }

  lessonSelect(var document) {
    switch (widget.bloque) {
      case 1:
        return document['Drogodependencia'];
      case 2:
        return document['Liderazgo'];
      case 3:
        return document['Intimidad'];
    }
  }
}
