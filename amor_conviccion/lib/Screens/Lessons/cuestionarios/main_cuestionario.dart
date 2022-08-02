import 'package:amor_conviccion/Screens/Lessons/cuestionarios/cuestionario/cuestionario.dart';
import 'package:amor_conviccion/Screens/Lessons/cuestionarios/cuestionario2/cuestionario2.dart';
import 'package:amor_conviccion/models/lessons_model.dart';
import 'package:flutter/material.dart';

class MainCuestionario extends StatefulWidget {
  const MainCuestionario(
      this.nombloq, this.bloque, this.nombre, this.completed, this.puntosl,
      {Key? key})
      : super(key: key);

  final String nombloq; //Nombre del bloque
  final String nombre; //Nombre de la leccion
  final int bloque; //A que bloque perteece
  final bool completed; //Esta completada o no la leccion
  final int puntosl; //Puntos que otorga la leccion

  @override
  State<MainCuestionario> createState() => _MainCuestionarioState();
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
        child: Scaffold(
            body: (widget.nombre == 'cuestionario')
                ? CuestionarioScreen()
                : const Cuestionario2Screen()));
  }
}
