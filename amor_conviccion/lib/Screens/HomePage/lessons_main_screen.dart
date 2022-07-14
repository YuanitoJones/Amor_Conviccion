import 'package:amor_conviccion/Screens/Lessons/lesson_selection_screen.dart';
import 'package:flutter/material.dart';

class MainLessons extends StatelessWidget {
  MainLessons({Key? key}) : super(key: key);

  List<String> asset = [
    'drogodependencia',
    'mochila',
    'noto_heartsuit',
    'noto_heartsuit',
    'noto_heartsuit'
  ];
  List<String> bloqnom = [
    'Drogodependencia',
    'Liderazgo',
    'Intimidad',
    'Anomia',
    'Amor y perdón'
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: size.height * 0.35,
          decoration: const BoxDecoration(
              color: Color(0xFF42ADE2),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: size.width * 0.35,
                        height: size.height * 0.25,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: ClipOval(
                              child: Image.asset(
                            'assets/logos/pentagono.png',
                            fit: BoxFit.fill,
                          )),
                        ),
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
                SizedBox(
                  height: size.height * 0.6,
                  child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 4, color: const Color(0xFFFF7E27)),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          // Bloque #1
                          margin: EdgeInsets.fromLTRB(
                            size.width * 0.1,
                            size.height * 0.03,
                            size.width * 0.1,
                            0,
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.fromLTRB(
                                0,
                                size.width * 0.08,
                                0,
                                size.width * 0.08,
                              ),
                              foregroundColor: Colors.black54,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LessonSelectionScreen(
                                        index + 1, bloqnom[index]))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                    height: size.height * 0.08,
                                    child: Image.asset(
                                        'assets/Icons/${asset[index]}.png')),
                                Column(
                                  children: [
                                    Text(
                                      bloqnom[index],
                                      style: TextStyle(
                                        fontSize: size.width * 0.05,
                                      ),
                                    ),
                                    Text(
                                      'Bloque #${index + 1}',
                                      style: TextStyle(
                                        fontSize: size.width * 0.035,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
