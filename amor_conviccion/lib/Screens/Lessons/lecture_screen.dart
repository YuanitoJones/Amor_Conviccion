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
  late Map lectura;
  late int contador = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    switch (widget.bloque) {
      case 1:
        lectura = bloque.Drogodependencia;
        break;
      case 2:
        lectura = bloque.Liderazgo;
    }
    late List? pagina = lectura[contador];

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
            if (contador != 0) {
              contador--;
              pagina = lectura[contador];
              setState(() {});
            } else {
              Navigator.pop(context);
            }
          },
          icon: const Icon(
            Icons.keyboard_backspace_rounded,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => {},
            child: Text(
              pagina![0],
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
                    pagina![1],
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
                child: RawScrollbar(
                  thumbVisibility: true,
                  thumbColor: const Color(0xFF42ADE2),
                  thickness: 1.5,
                  child: SingleChildScrollView(
                    child: Text(
                      pagina![2],
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Comfortaa',
                        fontSize: size.width * 0.045,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              // -------------------------------------------------------- Imagen
              margin: const EdgeInsets.only(bottom: 20), //---------------------
              child: Stack(
                children: [
                  Opacity(
                      opacity: 0.2,
                      child: Image.network(
                        pagina![3],
                        color: Colors.black,
                        height: size.height * 0.2,
                      )),
                  ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: Image.network(
                        pagina![3],
                        height: size.height * 0.2,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                (contador != 0)
                    ? SizedBox(
                        // ----------------------------------------------- Boton Siguiente
                        width: size.width * 0.35,
                        height: size.height * 0.065,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFFFF7E27),
                            elevation: 4,
                          ),
                          onPressed: () {
                            //Seccion dinamica de las lecturas
                            if (contador != 0) {
                              contador--;
                              pagina = lectura[contador];
                              setState(() {});
                            }
                          },
                          child: const Text(
                            'Atrás',
                            style: TextStyle(
                              fontFamily: 'Comfortaa',
                              fontSize: 15,
                            ),
                          ),
                        ),
                      )
                    : Container(),
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.06),
                  child: SizedBox(
                    // ----------------------------------------------- Boton Siguiente
                    width: size.width * 0.35,
                    height: size.height * 0.065,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFFFF7E27),
                        elevation: 4,
                      ),
                      onPressed: () {
                        //Seccion dinamica de las lecturas
                        if (contador != lectura.length - 1) {
                          contador++;
                          pagina = lectura[contador];
                          setState(() {});
                        } else {
                          if (!widget.flag) {
                            UpdateLesson lesson = UpdateLesson();
                            switch (widget.bloque) {
                              case 1:
                                lesson.updateCompleted(
                                    'Drogodependencia', widget.nombre);
                                break;
                              case 2:
                                lesson.updateCompleted(
                                    'Liderazgo', widget.nombre);
                                break;
                            }
                          }
                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        pagina![4],
                        style: const TextStyle(
                          fontFamily: 'Comfortaa',
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
