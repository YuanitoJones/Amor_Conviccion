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

  final String nombloq;
  final int bloque;
  final String nombre;
  final bool completed;
  final int puntosl;

  static LessonsModel? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LessonsModel>();
  }

  @override
  bool updateShouldNotify(LessonsModel oldWidget) {
    return nombloq != oldWidget.nombloq || nombre != oldWidget.nombre;
  }
}
