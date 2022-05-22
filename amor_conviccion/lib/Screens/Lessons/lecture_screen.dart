import 'dart:ui';

import 'package:amor_conviccion/utils/lecturas.dart';
import 'package:flutter/material.dart';

class LectureScreen extends StatefulWidget {
  const LectureScreen({Key? key}) : super(key: key);

  @override
  State<LectureScreen> createState() => _LectureScreenState();
}

class _LectureScreenState extends State<LectureScreen> {

  MapLectura bloque = MapLectura();
  late List? lectura;
  late int contador = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    lectura = bloque.Drogodependencia[contador];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(38, 70, 83, 1.0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25), //-------------------------------------
          ),
        ),
        leading: IconButton(
          splashRadius: 28, //--------------------------------------------------
          onPressed: () {
            print(lectura.toString());
          },
          icon: const Icon(
            Icons.keyboard_backspace_rounded,
          ),
        ),
        actions: [
          TextButton(
            onPressed: null,
            child: Text(
              lectura![0],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 19, //------------------------------------------------
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20), //-----------------------------------
        width: size.width,
        child: Column(
          children: [
            Container(
              // -------------------------------------------- Titulo y subtitulo
              margin: const EdgeInsets.only(bottom: 20), //---------------------
              child: Column(
                children: const [
                  Text(
                    'Peter Pan',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30, //------------------------------------------
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Comfortaa',
                    ),
                  ),
                  Text(
                    'Lectura',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize:
                          20, //------------------------------------------------
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Comfortaa',
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // ------------------------------------------------------- Lectura
              margin: const EdgeInsets.only(bottom: 20), //---------------------
              padding: const EdgeInsets.all(20), //-----------------------------
              width: size.width,
              height: 250, //---------------------------------------------------
              decoration: BoxDecoration(
                color: const Color.fromRGBO(233, 196, 106, 1.0),
                borderRadius: BorderRadius.circular(25), //---------------------
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 0,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Text(
                lectura![1],
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'Comfortaa',
                ),
              ),
            ),
            Container(
              // -------------------------------------------------------- Imagen
              margin: const EdgeInsets.only(bottom: 20), //---------------------
              child: Stack(
                children: [
                  // Image.asset(
                  //   'assets/logos/peter pan.png',
                  //   height: 200, //------------------------------------------
                  // ),
                  // Image.asset(
                  //   'assets/logos/peter pan.png',
                  //   height: 200, //------------------------------------------
                  // ),
                  Opacity(
                      opacity: 0.2,
                      child: Image.asset(
                        'assets/logos/peter pan.png',
                        color: Colors.black,
                        height: 200,
                      )),
                  ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: Image.asset(
                        'assets/logos/peter pan.png',
                        height: 200,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              // ----------------------------------------------- Boton Siguiente
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(231, 111, 81, 1.0),
                  elevation: 4,
                ),
                onPressed: () {
                  contador = contador + 1;
                  lectura = bloque.Drogodependencia[contador];
                  setState(() {});
                },
                child: Text(
                  lectura![3],
                  style: const TextStyle(
                    fontFamily: 'Comfortaa',
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}