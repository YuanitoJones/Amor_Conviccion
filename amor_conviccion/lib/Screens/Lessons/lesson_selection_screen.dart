import 'package:amor_conviccion/widgets/lesson_select_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LessonSelectionScreen extends StatelessWidget {
  LessonSelectionScreen(this.bloque, this.nombloq, {Key? key})
      : super(key: key);

  final String nombloq; //Nombre del bloque
  final int bloque; //Bloque de informacion

  final _user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background/standard.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
                      child: Text('Opps! Algo salió mal'),
                    );
                  } else {
                    var document = snapshot.data!.docs[0];
                    var info = document[nombloq];
                    return Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(size.width * 0.1),
                          child: Center(
                            child: Text(
                              nombloq,
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
                        for (int i = 0; i < info.keys.length; i += 2)
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  createLessons(
                                      size, info, info.keys.toList()[i], i + 1),
                                  if (i + 1 < info.keys.length)
                                    createLessons(size, info,
                                        info.keys.toList()[i + 1], i + 2),
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
      ),
    );
  }

  Widget createLessons(Size size, var info, String leccion, int lessonNumber) {
    return Column(
      children: [
        LessonSelect(
            (info[leccion]['puntos'] != null) ? info[leccion]['puntos'] : 0,
            nombloq,
            bloque,
            info.keys.toList()[lessonNumber - 1],
            info[leccion]['completado'],
            lessonNumber),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Text(
            info.keys
                    .toList()[lessonNumber - 1]
                    .toString()
                    .substring(0, 1)
                    .toUpperCase() +
                info.keys.toList()[lessonNumber - 1].toString().substring(1),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: size.width * 0.05,
            ),
          ),
        ),
      ],
    );
  }
}
