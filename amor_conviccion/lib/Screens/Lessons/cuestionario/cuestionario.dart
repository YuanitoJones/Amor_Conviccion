import 'package:amor_conviccion/Screens/Lessons/cuestionario/bloque1.dart';
import 'package:amor_conviccion/Screens/Lessons/cuestionario/bloque2.dart';
import 'package:flutter/material.dart';

class CuestionarioScreen extends StatefulWidget {
  CuestionarioScreen(this.bloque, this.nombre, this.completed, this.puntosl,
      {Key? key})
      : super(key: key);

  @override
  _CuestionarioScreen createState() => _CuestionarioScreen();

  int puntos = 0; //Puntuacion de evalacion inicial
  final String nombre; //Nombre de la leccion
  final int bloque; //A que bloque perteece
  final bool completed; //Esta completada o no la leccion
  final int puntosl; //Puntos que otorga la leccion
}

class _CuestionarioScreen extends State<CuestionarioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
              child: (widget.bloque == 1)
                  ? CuestBloq1(widget.bloque, widget.nombre, widget.completed,
                      widget.puntosl)
                  : (widget.bloque == 2)
                      ? CuestBloq2(widget.bloque, widget.nombre,
                          widget.completed, widget.puntosl)
                      : Container()),
        ));
  }
}
