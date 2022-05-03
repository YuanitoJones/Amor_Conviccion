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
          Container(
            // Espacio extra de arriba
            // color: Colors.green,
            height: size.height * 0.025,
          ),
          Container(
            // Donde se encuentra el logo y el nombre del curso
            // color: Colors.blue,
            child: Row(
              children: [
                Container(
                  // color: Colors.red,
                  width: size.width * 0.5,
                  height: size.height * 0.2,
                  child: Image.asset(
                    'assets/logos/pentagono.png',
                  ),
                ),
                Container(
                  // color: Colors.purple,
                  width: size.width * 0.5,
                  height: size.height * 0.2,
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
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
            width: double.infinity,
            height: size.height * 0.5882,
            // color: Colors.yellow,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BotonLeccion('Drogodependencia', 'Bloque #1'),
                BotonLeccion('Drogodependencia', 'Bloque #2'),
                BotonLeccion('Drogodependencia', 'Bloque #3'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: main(size),
    );
  }
}

class BotonLeccion extends StatelessWidget {
  final String tituloBloque;
  final String bloque;

  BotonLeccion(this.tituloBloque, this.bloque);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 60, right: 60),
      width: double.infinity,
      child: RaisedButton(
        padding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        onPressed: null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.book,
              size: 40,
            ),
            Column(
              children: [
                Text(
                  tituloBloque,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Text(
                  bloque,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
