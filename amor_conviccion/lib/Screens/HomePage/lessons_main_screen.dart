import 'package:amor_conviccion/Screens/Lessons/lesson_selection_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainLessons extends StatelessWidget {
  MainLessons({Key? key}) : super(key: key);

  final _user = FirebaseAuth.instance.currentUser;
  late final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('Lecciones1')
      .doc(_user!.email)
      .snapshots() as Stream<QuerySnapshot<Object?>>;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: size.height * 0.35,
          decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.03),
                  // -----------------------------------------------------------------
                  // Remover el espacio extra entre la imagen y el container.
                  // -----------------------------------------------------------------
                  // color: Colors.orange,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/logos/pentagono.png',
                        width: size.width * 0.35,
                      ),
                      Column(
                        children: [
                          Text(
                            'El Pentagono',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width * 0.07,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Comfortaa'),
                          ),
                          Text(
                            'Curso',
                            style: TextStyle(
                                fontSize: size.width * 0.06,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(width: 4, color: Colors.yellow.shade600),
                        borderRadius: BorderRadius.circular(35.0),
                      ),
                      // Bloque #1
                      margin: EdgeInsets.fromLTRB(
                        size.width * 0.15,
                        size.height * 0.03,
                        size.width * 0.15,
                        0,
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          // -----------------------------------------------------------
                          // Modificar el size.width para el top y bottom en el padding.
                          // -----------------------------------------------------------
                          padding: EdgeInsets.fromLTRB(
                            0,
                            size.width * 0.1,
                            0,
                            size.width * 0.1,
                          ),
                          onPrimary: Colors.black,
                          // -------------------------------------------------------
                          // El borde redondeado esta con un valor estatico.
                          // -------------------------------------------------------
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    LessonSelectionScreen(1))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.book,
                              size: size.width * .125,
                            ),
                            Column(
                              children: [
                                Text(
                                  'Drogodependencia',
                                  style: TextStyle(
                                    fontSize: size.width * 0.05,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Bloque #1',
                                  style: TextStyle(
                                    fontSize: size.width * 0.035,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(width: 4, color: Colors.yellow.shade600),
                        borderRadius: BorderRadius.circular(35.0),
                      ),
                      // Bloque #1
                      margin: EdgeInsets.fromLTRB(
                        size.width * 0.15,
                        size.height * 0.03,
                        size.width * 0.15,
                        0,
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          // -----------------------------------------------------------
                          // Modificar el size.width para el top y bottom en el padding.
                          // -----------------------------------------------------------
                          padding: EdgeInsets.fromLTRB(
                            0,
                            size.width * 0.1,
                            0,
                            size.width * 0.1,
                          ),
                          onPrimary: Colors.black,
                          // -------------------------------------------------------
                          // El borde redondeado esta con un valor estatico.
                          // -------------------------------------------------------
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    LessonSelectionScreen(2))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.book,
                              size: size.width * .125,
                            ),
                            Column(
                              children: [
                                Text(
                                  'Liderazgo',
                                  style: TextStyle(
                                    fontSize: size.width * 0.05,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Bloque #2',
                                  style: TextStyle(
                                    fontSize: size.width * 0.035,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      // Bloque #3
                      margin: EdgeInsets.fromLTRB(
                        size.width * 0.15,
                        size.height * 0.03,
                        size.width * 0.15,
                        0,
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          // -----------------------------------------------------------
                          // Modificar el size.width para el top y bottom en el padding.
                          // -----------------------------------------------------------
                          padding: EdgeInsets.fromLTRB(
                            0,
                            size.width * 0.04,
                            0,
                            size.width * 0.04,
                          ),
                          onPrimary: Colors.black,
                          // -------------------------------------------------------
                          // El borde redondeado esta con un valor estatico.
                          // -------------------------------------------------------
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: null,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.book,
                              size: size.width * .125,
                            ),
                            Column(
                              children: [
                                Text(
                                  'Lección',
                                  style: TextStyle(
                                    fontSize: size.width * 0.05,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Bloque #3',
                                  style: TextStyle(
                                    fontSize: size.width * 0.035,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
