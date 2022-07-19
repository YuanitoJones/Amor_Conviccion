import 'package:amor_conviccion/Screens/Lessons/cuestionario2/bloque2.dart';
import 'package:flutter/material.dart';

import 'bloque3.dart';

class Cuestionario2Screen extends StatefulWidget {
  Cuestionario2Screen(
      this.nombloq, this.bloque, this.nombre, this.completed, this.puntosl,
      {Key? key})
      : super(key: key);

  @override
  _Cuestionario2Screen createState() => _Cuestionario2Screen();

  int puntos = 0; //Puntuacion de evalacion inicial
  final String nombloq; //Nombre del bloque
  final String nombre; //Nombre de la leccion
  final int bloque; //A que bloque perteece
  final bool completed; //Esta completada o no la leccion
  final int puntosl; //Puntos que otorga la leccion
}

class _Cuestionario2Screen extends State<Cuestionario2Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
              child: (widget.bloque == 2)
                  ? Cuest2Bloq2(widget.nombloq, widget.bloque, widget.nombre,
                      widget.completed, widget.puntosl)
                  : (widget.bloque == 3)
                      ? Cuest2Bloq3(widget.nombloq, widget.bloque,
                          widget.nombre, widget.completed, widget.puntosl)
                      : Container()),
        ));
  }
}
