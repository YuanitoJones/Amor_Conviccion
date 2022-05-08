import 'package:amor_conviccion/Screens/Lessons/lesson_selection_screen.dart';
import 'package:flutter/material.dart';

class MainLessons extends StatefulWidget {
  const MainLessons({Key? key}) : super(key: key);

  @override
  _MainLessons createState() => _MainLessons();
}

class _MainLessons extends State<MainLessons> {
  Widget main(Size size) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.05,
          ),
          SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                SizedBox(
                  width: size.width * 0.5,
                  height: size.height * 0.2,
                  child: Image.asset(
                    'assets/logos/pentagono.png',
                  ),
                ),
                SizedBox(
                  width: size.width * 0.5,
                  height: size.height * 0.2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'El Pentagono',
                        style: TextStyle(
                            fontSize: size.height * 0.035,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Curso',
                        style: TextStyle(
                          fontSize: size.height * 0.035,
                          color: const Color.fromARGB(181, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 40),
            width: size.width * 0.8,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: TextButton(
              onPressed: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => LessonSelectionScreen()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.person, size: size.height * 0.075),
                  Column(
                    children: [
                      Text(
                        'Drogodependencia',
                        style: TextStyle(
                          fontSize: size.height * 0.025,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Bloque 1',
                        style: TextStyle(
                          fontSize: size.height * 0.0225,
                          color: const Color.fromARGB(181, 0, 0, 0),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 60),
            width: size.width * 0.8,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: TextButton(
              onPressed: null,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.person, size: size.height * 0.075),
                  Column(
                    children: [
                      Text(
                        'Drogodependencia',
                        style: TextStyle(
                          fontSize: size.height * 0.025,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Bloque 2',
                        style: TextStyle(
                          fontSize: size.height * 0.0225,
                          color: const Color.fromARGB(181, 0, 0, 0),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 60),
            width: size.width * 0.8,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: TextButton(
              onPressed: null,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.person, size: size.height * 0.075),
                  Column(
                    children: [
                      Text(
                        'Drogodependencia',
                        style: TextStyle(
                          fontSize: size.height * 0.025,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Bloque 3',
                        style: TextStyle(
                          fontSize: size.height * 0.0225,
                          color: const Color.fromARGB(181, 0, 0, 0),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return main(size);
  }
}
