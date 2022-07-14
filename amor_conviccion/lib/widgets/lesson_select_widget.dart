import 'package:amor_conviccion/Screens/Lessons/Mensaje_Intimo/option_screen.dart';
import 'package:amor_conviccion/Screens/Lessons/cuestionario/cuestionario.dart';
import 'package:amor_conviccion/Screens/Lessons/cuestionario_lineas.dart';
import 'package:amor_conviccion/Screens/Lessons/lecture_screen.dart';
import 'package:amor_conviccion/Screens/Lessons/video_screen.dart';
import 'package:amor_conviccion/services/authentication.dart';
import 'package:flutter/material.dart';

class LessonSelect extends StatefulWidget {
  const LessonSelect(
    this.puntos,
    this.nombloq,
    this.bloque,
    this.texto,
    this.flag,
    this.lesson, {
    Key? key,
  }) : super(key: key);

  final int puntos; //Puntos que asigna la leccion
  final String nombloq; //Nombre del bloque
  final int bloque; //Bloque de lecciones
  final int lesson; //Numero de leccion
  final String texto; //Nombre de leccion
  final bool flag; //completado de la leccion

  @override
  State<LessonSelect> createState() => _LessonSelect();
}

class _LessonSelect extends State<LessonSelect> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: size.width * 0.3,
          height: size.width * 0.3,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(50.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: (widget.flag)
                      ? const Color(0xFF5cb85c)
                      : const Color(0xFFEE4A4A),
                  spreadRadius: 3,
                  blurRadius: 10,
                )
              ]),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: size.width * 0.015,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(90),
                  //side: (widget.flag)
                  // ? const BorderSide(color: Colors.green, width: 3)
                  // : const BorderSide(color: Colors.red, width: 3),
                ),
                primary: Colors.white),
            child: lessonIcon(size, widget.texto),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => (widget.texto == 'lectura')
                          ? LectureScreen(
                              widget.bloque, widget.texto, widget.flag)
                          : (widget.texto == 'cuestionario')
                              ? CuestionarioScreen(
                                  widget.nombloq,
                                  widget.bloque,
                                  widget.texto,
                                  widget.flag,
                                  widget.puntos)
                              : (widget.texto == 'video')
                                  ? VideoPlayerScreen(
                                      widget.bloque, widget.texto, widget.flag)
                                  : (widget.texto == 'cuestionario 2')
                                      ? LineLessonScreen(
                                          widget.nombloq,
                                          widget.bloque,
                                          widget.texto,
                                          widget.flag,
                                          widget.puntos)
                                      : (widget.texto == 'mensaje')
                                          ? const OptionScreen()
                                          : const Authentication()));
            },
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: buildEditIcon(const Color(0xFF42ADE2), size),
        ),
      ],
    );
  }

  Icon lessonIcon(Size size, String texto) {
    if (widget.texto == 'lectura') {
      return Icon(
        Icons.book,
        size: size.width * 0.17,
        color: Colors.blue,
      );
    } else if (widget.texto == 'cuestionario' ||
        widget.texto == 'cuestionario 2') {
      return Icon(
        Icons.account_circle,
        size: size.width * 0.2,
        color: Colors.blue,
      );
    } else if (widget.texto == 'video') {
      return Icon(
        Icons.video_call_rounded,
        size: size.width * 0.2,
        color: Colors.blue,
      );
    } else if (widget.texto == 'mensaje') {
      return Icon(
        Icons.message,
        size: size.width * 0.15,
        color: Colors.blue,
      );
    } else {
      return Icon(
        Icons.dangerous,
        size: size.width * 0.2,
        color: Colors.blue,
      );
    }
  }

  Widget buildEditIcon(Color color, Size size) => buildCircle(
      child: Text(
        widget.lesson.toString(),
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: size.width * 0.033,
            color: Colors.white),
      ),
      all: size.width * 0.036,
      color: const Color(0xFF42ADE2));

  Widget buildCircle(
          {required Widget child, required double all, required Color color}) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
