import 'package:amor_conviccion/Screens/Lessons/cuestionarios/cuestionario/cuestionario.dart';
import 'package:amor_conviccion/Screens/Lessons/cuestionarios/cuestionario2/cuestionario2.dart';
import 'package:amor_conviccion/models/lessons_model.dart';
import 'package:flutter/material.dart';

class MainCuestionario extends StatefulWidget {
  MainCuestionario(
      this.nombloq, this.bloque, this.nombre, this.completed, this.puntosl,
      {Key? key})
      : super(key: key);

  int puntos = 0; //Puntuacion de evalacion inicial
  final String nombloq; //Nombre del bloque
  final String nombre; //Nombre de la leccion
  final int bloque; //A que bloque perteece
  final bool completed; //Esta completada o no la leccion
  final int puntosl; //Puntos que otorga la leccion

  @override
  _MainCuestionarioState createState() => _MainCuestionarioState();
}

class _MainCuestionarioState extends State<MainCuestionario> {
  @override
  Widget build(BuildContext context) {
    return LessonsModel(
        nombloq: widget.nombloq,
        bloque: widget.bloque,
        nombre: widget.nombre,
        completed: widget.completed,
        puntosl: widget.puntosl,
        child: (widget.nombre == 'cuestionario')
            ? CuestionarioScreen()
            : Cuestionario2Screen());
  }
}
