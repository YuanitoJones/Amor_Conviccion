import 'dart:ui';

import 'package:amor_conviccion/services/UpdateInfo.dart';
import 'package:amor_conviccion/utils/lecturas.dart';
import 'package:flutter/material.dart';

class LectureScreen extends StatefulWidget {
  const LectureScreen(this.bloque, this.nombre, this.flag, {Key? key})
      : super(key: key);

  final bool flag;
  final String nombre;
  final int bloque;
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
        backgroundColor: const Color(0xFF42ADE2),
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
              style: TextStyle(
                color: Colors.white,
                fontSize: size.width *
                    0.055, //------------------------------------------------
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
                children: [
                  Text(
                    'Que significa ser adicto',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: size.width *
                          0.08, //------------------------------------------
                      fontFamily: 'Comfortaa',
                    ),
                  ),
                  Text(
                    'Lectura',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: size.width *
                          0.06, //------------------------------------------------
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Comfortaa',
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // ------------------------------------------------------- Lectura
              margin: EdgeInsets.only(
                  bottom: size.height * 0.03), //---------------------
              padding: EdgeInsets.all(
                  size.height * 0.03), //-----------------------------
              width: size.width,
              height: size.height *
                  0.35, //---------------------------------------------------
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
              child: Center(
                child: Text(
                  lectura![1],
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Comfortaa',
                  ),
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
                      child: Image.network(
                        lectura![2],
                        color: Colors.black,
                        height: size.height * 0.2,
                      )),
                  ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: Image.network(
                        lectura![2],
                        height: size.height * 0.2,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              // ----------------------------------------------- Boton Siguiente
              width: size.width * 0.5,
              height: size.height * 0.065,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFFFF7E27),
                  elevation: 4,
                ),
                onPressed: () {
                  if (contador != 2) {
                    contador = contador + 1;
                    lectura = bloque.Drogodependencia[contador];
                    setState(() {});
                  } else {
                    if (!widget.flag) {
                      UpdateLesson lesson = UpdateLesson();
                      switch (widget.bloque) {
                        case 1:
                          lesson.updateLectureCompleted(
                              'Drogodependencia', widget.nombre);
                          break;
                        case 2:
                          lesson.updateLectureCompleted(
                              'Liderazgo', widget.nombre);
                          break;
                      }
                    }
                    Navigator.pop(context);
                  }
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
