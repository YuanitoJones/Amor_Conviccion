import 'package:flutter/material.dart';

class LessonsModel extends InheritedWidget {
  const LessonsModel(
      {Key? key,
      required this.nombloq,
      required this.bloque,
      required this.nombre,
      required this.completed,
      required this.puntosl,
      required Widget child})
      : super(key: key, child: child);

  final String nombloq; //Nombre del bloque
  final int bloque; //Bloque de ejercicio
  final String nombre; //Nombre de la leccion
  final bool completed; //Se ha completado antes la leccion (otorga puntos o no)
  final int puntosl; //Puntos que otorga la leccion

  static LessonsModel? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LessonsModel>();
  }

  @override
  bool updateShouldNotify(LessonsModel oldWidget) {
    return nombloq != oldWidget.nombloq || nombre != oldWidget.nombre;
  }
}
